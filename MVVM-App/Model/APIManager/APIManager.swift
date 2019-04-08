
import Foundation
import Alamofire

let kBaseServiceUrl = Configurations(Constants.ConfigurationKeys.baseServiceURL).parameter as? String

private enum ResponseCode: Int {
    case success = 200
    case created = 201
    case deviceRegistered = 202
    case internalServerError = 500
    case authenticationFailed = 401
    case requestDenied = 403
    case notFound = 404
    case emptyData = 901
    case invalidJSON = 902
}

private enum ResponseError: Error {
    case requestDenied
    case internalServer
    case authenticationFailed
    case somethingWentWrong
    case recordNotFound
    case emptyData
    case invalidJSON
}

extension ResponseError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .requestDenied:
            return NSLocalizedString("error_request_denied", comment: "error")
        case .internalServer:
            return NSLocalizedString("error_internal_server", comment: "error")
        case .authenticationFailed:
            return NSLocalizedString("error_authentication_failed", comment: "error")
        case .somethingWentWrong:
            return NSLocalizedString("error_something_went_wrong", comment: "error")
        case .recordNotFound:
            return NSLocalizedString("error_records_not_found", comment: "error")
        case .emptyData:
            return NSLocalizedString("error_empty_data", comment: "error")
        case .invalidJSON:
            return NSLocalizedString("error_invalid_json", comment: "error")
        }
    }
}

//JSONEncoding.default // GET
//URLEncoding.default // POST

class APIManager: NSObject {
    var httpMethod: HTTPMethod? = .post
    var serviceUrl: String?
    var parameters: [String: Any] = [:]
    var headers: [String: String] = ["Content-Type": "application/json"]
    var encoding: ParameterEncoding? = JSONEncoding.default
    var info: [String: Any] = [:]
    var dataRequest: DataRequest?
    
    func dataServiceRequest(isAuthentication: Bool, completionHandler: @escaping (_ data: Data?, _ error: AnyObject?) -> Void) {
        if !isAuthentication {
            dataServiceRequest { (data, error) in
                completionHandler(data, error)
            }
        } else {
            dataServiceRequestWithAuth { (data, error) in
                completionHandler(data, error)
            }
        }
    }
    
    private func dataServiceRequest(completionHandler: @escaping (_ data: Data?, _ error: AnyObject?) -> Void) {
        let headerValues = self.headersValues()
        dataRequest = Alamofire.request(serviceUrl ?? "", method: httpMethod!, parameters: parameters, encoding: encoding!, headers: headerValues ).responseString(completionHandler: { (response) in
            self.handleResponse(response: response, completionHandler: { (data, error) in
                completionHandler(data, error)
            })
        })
    }
    
    private func dataServiceRequestWithAuth(completionHandler: @escaping (_ data: Data?, _ error: AnyObject?) -> Void) {
        let headerValues = self.basicAuthHeaders(headerValues: self.headersValues())
        dataRequest = Alamofire.request(serviceUrl ?? "", method: httpMethod!, parameters: parameters, encoding: encoding!, headers: headerValues).responseString(completionHandler: { (response) in
            self.handleResponse(response: response, completionHandler: { (data, error) in
                completionHandler(data, error)
            })
        })
    }
    
    private func headersValues() -> [String: String] {
        var headers = self.headers
        var versionString = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        let versionOnly = Configurations((Constants.ConfigurationKeys.versionOnly)).parameter as? Bool
        if !(versionOnly ?? false) {
            let buildNumber = Bundle.main.infoDictionary!["CFBundleVersion"] as! String
            versionString = versionString + "(" + buildNumber + ")"
        }
        headers["Medium"] = "3"
         headers["Referer"] = "http://192.168.105.111/Dashboard/CertLink/Trunk/Login.aspx"
        headers["App-Version"] = versionString
        return headers
    }
    
    private func basicAuthHeaders(headerValues: [String: String]) -> [String: String] {
        var headers = headerValues
        //headers["Authorization"] = "Basic \(UserDefaults.standard.value(forKey: UserDefauts.kSessionUid) as! String)"
        headers["AppLocation"] = "CertLink Dashboard"
        //headers["AppSetting"] = (UserDefaults.standard.value(forKey: UserDefauts.kAppuserId) as! String)
        headers["UserLocation"] = ""
        return headers
    }
    
    func cancelAPIRequest() {
        dataRequest?.cancel()
    }
}

extension APIManager {
    private func handleResponse(response: DataResponse<String>, completionHandler: @escaping (_ response: Data?, _ error: AnyObject?) -> Void) {
        if let data = response.data {
            switch response.result {
            case .success :
                switch (response.response?.statusCode)! {
                case ResponseCode.success.rawValue, ResponseCode.deviceRegistered.rawValue, ResponseCode.created.rawValue:
                    completionHandler(data, nil)
                default:
                    do {
                        printJSONDataString(data: data ?? Data())
                        let responseJSON = try JSONSerialization.jsonObject(with: data, options: .allowFragments )
                        print(responseJSON)
                        if responseJSON is [String: Any] {
                            let error = self.customError(errorCode: ResponseCode.invalidJSON)
                            completionHandler(nil, error)
                        } else {
                            let error = self.customError(errorCode: ResponseCode.invalidJSON)
                            completionHandler(nil, error)
                        }
                    } catch let error {
                        let errorBO = makeErrorBO(error, errorCode: 0)
                        completionHandler(nil, errorBO)
                    }
                }
            case .failure(let error):
                let errorBO = makeErrorBO(error, errorCode: 0)
                completionHandler(nil, errorBO)
            }
        } else {
            let error = self.customError(errorCode: ResponseCode.emptyData)
            completionHandler(nil, error)
        }
    }
    
    private func customError(errorCode: ResponseCode) -> ErrorBO {
        let error = customErrorObject(errorCode: errorCode)
        let errorBO = makeErrorBO(error!, errorCode: errorCode.rawValue)
        return errorBO
    }
    
    private func customErrorObject(errorCode: ResponseCode) -> Error? {
        switch errorCode {
        case .requestDenied:
            return ResponseError.requestDenied
        case .internalServerError:
            return ResponseError.internalServer
        case .authenticationFailed:
            return ResponseError.authenticationFailed
        case .notFound:
            return ResponseError.recordNotFound
        case .emptyData:
            return ResponseError.emptyData
        case .invalidJSON:
            return ResponseError.invalidJSON
        default:
            return ResponseError.somethingWentWrong
        }
    }
}

/// Convert NSError in ErrorBO
func makeErrorBO(_ error: Error, errorCode: Int) -> ErrorBO {
    let errorBO = ErrorBO()
    errorBO.code = errorCode
    errorBO.message = error.localizedDescription
    return errorBO
}

func printJSONDataString(data: Data?) {
    if data != nil {
        let responseString = String(data: data!, encoding: String.Encoding.utf8) ?? "Data could not be printed"
        print(responseString)
    }
}

func printDictionaryToJSON(params: [String: Any]) {
    do {
        let jsonData = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        // here "jsonData" is the dictionary encoded in JSON data
        let responseString = String(data: jsonData, encoding: String.Encoding.utf8) ?? "Params could not be printed"
        print(responseString)
    } catch {
        print(error.localizedDescription)
    }
}
