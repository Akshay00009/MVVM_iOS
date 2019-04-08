//
//  Constant.swift
//  Apex Rider
//
//  Created by Kishor Koli on 08/09/8.
//  Copyright © 2018 Kishor Koli. All rights reserved.
//

import UIKit

//com.apex.reservation.rider
class Constants: NSObject {

    static let appDelegate = UIApplication.shared.delegate as? AppDelegate
    static let userDefaults = UserDefaults.standard

    static let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)

    struct Screen {
        static let screenSize = UIScreen.main.bounds.size
        static let screenWidth = UIScreen.main.bounds.size.width
        static let screenheight = UIScreen.main.bounds.size.height
        static let screenX = UIScreen.main.bounds.origin.x
        static let screenY = UIScreen.main.bounds.origin.y
        static let iPhone4S: CGFloat = 480
        static let iPhone5S: CGFloat = 568
        static let IS_iPhone6: Bool = Constants.Screen.screenWidth == 375 ? true : false
        static let IS_iPhone6Plus: Bool = Constants.Screen.screenWidth == 414 ? true : false
        static let IS_iPhone5S: Bool = Constants.Screen.screenheight <= 568 ? true : false
        static let IS_IPAD = (UI_USER_INTERFACE_IDIOM() == .pad) ? true : false
    }
    
    struct Alert {
        static let alertTitle = NSLocalizedString("Alert", comment: "")
        static let alertErrorTitle = NSLocalizedString("Error", comment: "")
        static let comingSoon = NSLocalizedString("Coming Soon..", comment: "")
        static let okTitle = NSLocalizedString("Ok", comment: "")
        static let yesTitle = NSLocalizedString("Yes", comment: "")
        static let noTitle = NSLocalizedString("No", comment: "")

        static let cancel = NSLocalizedString("Annuleer", comment: "")
        static let reset = NSLocalizedString("Reset", comment: "")
        static let cancelTitle = NSLocalizedString("Cancel", comment: "")
        static let resendTitle = NSLocalizedString("Resend", comment: "")
        static let joinTitle = NSLocalizedString("Join", comment: "")
        static let setTitle = NSLocalizedString("Set", comment: "")

        static let notification = NSLocalizedString("Notification", comment: "")
        static let view = NSLocalizedString("View", comment: "")
        static let setting = NSLocalizedString("Setting", comment: "")
        static let success = NSLocalizedString("Success", comment: "")
        static let photoLibrary = NSLocalizedString("Photo Library Unavailable", comment: "")
        static let camera = NSLocalizedString("Camera Unavailable", comment: "")
        static let yes = NSLocalizedString("Yes", comment: "")
        static let no = NSLocalizedString("No", comment: "")
        static let choosePhoto = NSLocalizedString("Choose Photo", comment: "")
        static let fromCamera = NSLocalizedString("Camera", comment: "")
        static let fromLibrary = NSLocalizedString("Library", comment: "")

        static let deviceNotSupportsToCamera = NSLocalizedString("Your device doesn't support the camera feature.", comment: "")
    }
    
    struct Font {
        static let GillSansRegular = NSLocalizedString("GillSans", comment: "")
        static let GillSansBold = NSLocalizedString("GillSans-Bold", comment: "")
        static let GillSansBoldItalic = NSLocalizedString("GillSans-BoldItalic", comment: "")
        static let GillSansSemiBold = NSLocalizedString("GillSans-SemiBold", comment: "")
        static let GillSansItalic = NSLocalizedString("GillSans-Italic", comment: "")
    }

    struct DateFormatter {
        static let yyyy_MM_dd = "yyyy-MM-dd"
        static let MMM_dd_yyyy_HH_mm = "MMM dd,yyyy HH:mm"
        static let dd_MM_yy = "dd.MM.yy"
        static let h_mm_a = "h:mm a"
        static let YYYY_MM_DD_HH_mm_ss  = "YYYY-MM-dd HH:mm:ss"
    }
    
    struct FontName {
        static let DINBold = "DINBold"
        static let DINAlternate    = "DIN Alternate"
    }

    // MARK: - Web Services Constants
    struct Service {
        static let  id = "id"
        static let  error = "errors"
        static let  status = "Status"
        static let  error_detail = "message"
        static let  Content_Type = "Content-Type"
        static let  application_jsonType = "application/json"
        static let  data = "data"
        static let  results = "results"
        static let  request = "req="
        static let  appType = "app-type"
        static let  locale = "locale"
        static let  authorization = "Authorization"
        static let  message = "message"
        
    }

    struct Key {
        static let GET = "GET"
        static let DELETE = "DELETE"
        static let POST = "POST"
        static let PATCH = "PATCH"
    }
 
    // Start for Apex Rider
    struct ConfigurationKeys {
        static let baseServiceURL = "baseUrl"
        static let versionOnly = "versionOnly"
    }
    
}
