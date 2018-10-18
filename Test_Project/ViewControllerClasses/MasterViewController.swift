//
//  MasterViewController.swift
//  Test_Project
//
//  Created by Muhammad Arslan Khalid on 17/10/2018.
//  Copyright © 2018 3s. All rights reserved.
//

import UIKit

import QuartzCore
import Reachability
class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var nyTimeObjects = [Any]()
    var reachability = Reachability()!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       getDetailViewController()
       getNYTimeObject(sectionValue: "all-sections", periodValue: "7")
 
    }
    
    

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

   
 deinit {
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: reachability)
    }

}

