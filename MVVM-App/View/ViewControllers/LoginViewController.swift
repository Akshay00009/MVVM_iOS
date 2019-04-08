//
//  LoginViewController.swift
//  MVVM-App
//
//  Created by akshay Avati on 26/02/19.
//  Copyright © 2019 sagar.nikam. All rights reserved.
//

class LoginViewController: BaseViewController {
    var loginViewModel: LoginViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialiseLoginViewModel()
        loginValidation()
        // Do any additional setup after loading the view.
    }
    
    private func initialiseLoginViewModel() {
        if loginViewModel == nil {
            loginViewModel = LoginViewModel(delegate: self)
        }
    }
    
    private func loginValidation() {
        let parameter: [String : String] = ["LoginName":"ameydiptrunk6@yopmail.com",
                                            "Password":"Abcd1234#",
                                            "DeviceId":"1E4D17C5-FA64-4808-94E4-090519E89367",
                                            "DeviceName":"iPad Mini",
                                            "DeviceToken" : "A9E4C6E93C66F5C96121BFEFBAA7F93A86D034A8DF8B8D09997A2638BFDE06BF",
                                            "IsIOSDevice" : "1"]
        
        let uInfo: [String : AnyObject] = ["userInfo": parameter as AnyObject]
        doLogin(params: uInfo)
    }
    
    private func bindListenerObjects() {
        loginViewModel?.name1?.bind(listener: { (name) in
            
        })
        
        loginViewModel?.loginBO.bind(listener: { (loginBO) in
            print(loginBO as Any)
            print(loginBO?.helperForUserAuthenticationResult?.appDescription as Any)
            print(loginBO?.helperForUserAuthenticationResult?.appStatus as Any)
            
            print(loginBO?.helperForUserAuthenticationResult?.returnValue as Any)

        })
    }
    
    private func doLogin(params: [String: AnyObject]) {
        loginViewModel?.doLogin(params: params) { status in
            print(status)
            if status {
                self.bindListenerObjects()
            } else {
                // TODO: Handle error here
            }
            
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
