//
//  BaseViewController.swift
//  MVVM-App
//
//  Created by akshay Avati on 27/02/19.
//  Copyright © 2019 sagar.nikam. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

extension BaseViewController: ViewModelProtocol {
    func showInternalMessage(data: (message: String?, data: Any?)) {
        
    }
    
    func showActivityIndicator(info: [String: Any]?) {
        
    }
    
    func hideActivityIndicator(info: [String: Any]?) {
        
    }
}
