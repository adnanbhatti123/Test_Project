//
//  DetailViewController.swift
//  Test_Project
//
//  Created by Muhammad Arslan Khalid on 17/10/2018.
//  Copyright © 2018 3s. All rights reserved.
//

import UIKit
import WebKit
import Foundation
import MBProgressHUD
import QuartzCore

class DetailViewController: UIViewController, WKNavigationDelegate  {
 
    var nyTime:NYTime!
    @IBOutlet weak var webView:WKWebView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureWebView()
    }
 
    
 
    
 


}

