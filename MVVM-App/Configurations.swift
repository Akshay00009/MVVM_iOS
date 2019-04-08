//
//  Configurations.swift
//  Apex Rider
//
//  Created by amol on 9/9/18.
//  Copyright © 2018 Kishor Koli. All rights reserved.
//

import Foundation

class Configurations  {
    
    var parameter: Any?
    
    init(_ param: String) {
        if let dictionary = Bundle.main.infoDictionary,
            let configuration = dictionary["Configurations"] as? String {
            let path = Bundle.main.path(forResource: "Configurations", ofType: "plist")
            if let config = NSDictionary(contentsOfFile: path ?? "") {
                if let environment = config[configuration] as? [String: Any] {
                    parameter = environment[param]
                }
            }
        }
    }
}
