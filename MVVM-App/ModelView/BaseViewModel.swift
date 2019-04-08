//
//  BaseViewModel.swift
//  MVVM-App
//
//  Created by akshay Avati on 27/02/19.
//  Copyright © 2019 sagar.nikam. All rights reserved.
//

import Foundation
let kSuccessHandler = "SuccessHandler"
let kFailHandler = "FailHandler"

protocol ViewModelProtocol: class {
    func showInternalMessage(data: (message: String?, data: Any?))
    func showActivityIndicator(info: [String: Any]?)
    func hideActivityIndicator(info: [String: Any]?)
}

class BaseViewModel: NSObject {
    var info: [String : Any] = [:]
    
    weak var viewModelDelegate: ViewModelProtocol?
    init(delegate: ViewModelProtocol?) {
        viewModelDelegate = delegate
    }

    func showConnectionErrorMessage() {
        let message = ""
        viewModelDelegate?.showInternalMessage(data: (message: message, data: nil))
    }
}
