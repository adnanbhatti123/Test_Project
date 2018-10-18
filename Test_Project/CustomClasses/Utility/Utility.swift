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
 
    
  
}
