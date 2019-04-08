//
//  LoginService.swift
//  MVVM-App
//
//  Created by akshay Avati on 27/02/19.
//  Copyright © 2019 sagar.nikam. All rights reserved.
//

import UIKit
import Alamofire

class LoginService: NSObject {
    private var apiManager = APIManager()

    public func requestToLogin(params: [String: Any]?, handler: @escaping (_ loginBO: LoginBO?, _ error: ErrorBO?) -> Void) {
        apiManager.serviceUrl = (kBaseServiceUrl ?? "") + API.Service.kLoginAPI
        apiManager.parameters = params ?? [:]

        apiManager.dataServiceRequest(isAuthentication: false) { (data, error) in
            printJSONDataString(data: data)
            if data != nil {
                do {
                    let loginDetails = try JSONDecoder().decode(LoginBO.self, from: data ?? Data())
                    handler(loginDetails, nil)
                } catch let error {
                    let errorBO = makeErrorBO(error, errorCode: 0)
                    handler(nil,errorBO)
                }
            } else {
                handler(nil,error as? ErrorBO)
            }
        }
    }
}

