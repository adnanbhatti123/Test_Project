//
//  Utility.swift
//  Test_Project
//
//  Created by Muhammad Arslan Khalid on 18/10/2018.
//  Copyright © 2018 3s. All rights reserved.
//

import UIKit

class Utility: NSObject {
 
    class func showAlert(alertTitle:String,alertMessage:String, controller:UIViewController){
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
 
    
    class func formatString(unformattedString:String) -> String{
       let stringArray = unformattedString.replacingOccurrences(of: "By", with: "").components(separatedBy: " ")
       var returnString = ""
        if stringArray.count > 2 {
            returnString = "\(stringArray[1]) \(stringArray[2])"
        }
        else if stringArray.count == 2 {
            returnString = "\(stringArray[0])"
            
        }
        
        return returnString
    }
}
