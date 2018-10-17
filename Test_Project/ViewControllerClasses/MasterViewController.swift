//
//  MasterViewController.swift
//  Test_Project
//
//  Created by Muhammad Arslan Khalid on 17/10/2018.
//  Copyright © 2018 3s. All rights reserved.
//

import UIKit
import Foundation
import MBProgressHUD
import QuartzCore
class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var nyTimeObjects = [Any]()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        getNYTimeObject(sectionValue: "all-sections", periodValue: "7")
    }
    
    

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

   
    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = nyTimeObjects[indexPath.row] as! NSDate
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View Data Source Methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nyTimeObjects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let object = nyTimeObjects[indexPath.row] as! NSDate
        cell.textLabel!.text = object.description
        return cell
    }

   
    // MARK: - Fetch NY Time Data
    func getNYTimeObject(sectionValue:String, periodValue:String){
     
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        let networkObject = NetworkOperations.sharedInstance
        let urlString = NSString(format: "%@%@/%@/%@.json?%@", Constants.base_url,Constants.mostViewedApi,sectionValue,periodValue,Constants.apiKey)
        let requestObject = networkObject.getUrlRequestObject(urlString: urlString, httpHeaderField: "Content-Type", HttpHeaderFieldValue: "application/x-www-form-urlencoded", httpMethod: "GET", timeoutIntervial: 30.00)
        let session = networkObject.getSessionObject()
        networkObject.createUrlTask(requestObject: requestObject, session: session, onSuccess: { (nyObject) in
           
            if((nyObject?.object(forKey: "status") as? String) == "OK"){
                print("ny objects \(String(describing: nyObject))");
                
                if let result = nyObject
                
                for(object in nyobje){
                    
                }
                
            }
            
            DispatchQueue.main.async {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
            
        }) { (error) in
           
            DispatchQueue.main.async {
               MBProgressHUD.hide(for: self.view, animated: true)
            }
        }
        
    }

}

