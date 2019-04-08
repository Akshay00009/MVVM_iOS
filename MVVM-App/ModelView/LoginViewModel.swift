//
//  LoginModel.swift
//  MVVM-App
//
//  Created by akshay Avati on 26/02/19.
//  Copyright © 2019 sagar.nikam. All rights reserved.
//


class LoginViewModel: BaseViewModel {
    private var login: LoginBO!
    private var loginService: LoginService?
    //private var DataBO: DataBO?
    

   public var name1: Box<String>?
    
    var loginParams: Box<[String: AnyObject]> {
        return Box([:])
    }

    var callResult: Box<[String: AnyObject]> {
        return Box([:])
    }
    
    var loginBO: Box<LoginBO?> {
        return Box(self.login)
    }

    
    override init(delegate: ViewModelProtocol?) {
        super.init(delegate: delegate)
        initialiseLoginService()
    }
    
    private func initialiseLoginService() {
        if loginService == nil {
            loginService = LoginService()
        }
    }
    
    func validatedLoginFields(params: [String: String]) -> Bool {
        //loginParams = params
        return true
    }
    
    func doLogin(params: [String: Any], completion: @escaping((Bool) -> Void)) {
        if Utility.connectedToNetwork() {
            viewModelDelegate?.showActivityIndicator(info: nil)
            loginService?.requestToLogin(params: params, handler: {(loginBO, errorBO) in
                self.viewModelDelegate?.hideActivityIndicator(info: nil)
                if loginBO != nil {
                    completion(self.handleLoginSuccessResponse(loginBO: loginBO))
                } else {
                    completion(self.handleLoginFailureError(errorBO: errorBO))
                }
            })
        } else {
            showConnectionErrorMessage()
        }
    }
    
    private func handleLoginSuccessResponse(loginBO: LoginBO?) -> Bool {
        guard (loginBO != nil) else {
            return false
        }
        self.login = loginBO
        return true
    }
    
    private func handleLoginFailureError(errorBO: ErrorBO?) -> Bool {
        guard (errorBO != nil) else {
            return false
        }
        return true
    }
}
