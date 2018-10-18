//
//  Extentions.swift
//  Test_Project
//
//  Created by Muhammad Arslan Khalid on 18/10/2018.
//  Copyright © 2018 3s. All rights reserved.
//

import UIKit
import Foundation
import MBProgressHUD
import WebKit

extension UIImageView {
    
    func setRounded() {
        let radius = self.frame.width / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}

extension String{
    
    mutating func formatString(unformattedString:String) {
        let stringArray = unformattedString.replacingOccurrences(of: "By", with: "").components(separatedBy: " ")
        if stringArray.count > 2 {
            self  = "\(stringArray[1]) \(stringArray[2])"
        }
        else if stringArray.count == 2 {
            self  = "\(stringArray[0])"
            
        }
        
 
    }
}

extension MasterViewController {
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let nyTimeObj = nyTimeObjects[indexPath.row] as! NYTime
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.nyTime = nyTimeObj
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
        //  let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let cell = Bundle.main.loadNibNamed("NyTimesTableViewCell", owner: self, options: nil)![0] as! NyTimesTableViewCell
        
        let object = nyTimeObjects[indexPath.row] as! NYTime
        cell.setCellInfo(nyTimeObj: object)
        return cell
    }
    
    
    // MARK: - Table View Data Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showDetail", sender: nil)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 122.0
    }
    
    
    
    
    
    // MARK: - Fetch NY Time Data
    func getNYTimeObject(sectionValue:String, periodValue:String){
        reachability.whenReachable = { reachability in
            
            MBProgressHUD.showAdded(to: self.view, animated: true)
            let networkObject = NetworkOperations.sharedInstance
            let urlString = NSString(format: "%@%@/%@/%@.json?%@", Constants.base_url,Constants.mostViewedApi,sectionValue,periodValue,Constants.apiKey)
            let requestObject = networkObject.getUrlRequestObject(urlString: urlString, httpHeaderField: "Content-Type", HttpHeaderFieldValue: "application/x-www-form-urlencoded", httpMethod: "GET", timeoutIntervial: 30.00)
            let session = networkObject.getSessionObject()
            networkObject.createUrlTask(requestObject: requestObject, session: session, onSuccess: { (nyObject) in
                
                if((nyObject?.object(forKey: "status") as? String) == "OK"){
                    print("ny objects \(String(describing: nyObject))");
                    
                    if let result = nyObject?.object(forKey: "results") as? [Any]{
                        for object in result{
                            let nyTimeObject = NYTime.init(object: object as! NSDictionary)
                            self.nyTimeObjects.append(nyTimeObject)
                        }
                    }
                }
                
                self.hideProgressAndReloadTable(errorMessage:nil)
                
            }) { (error) in
                
                self.hideProgressAndReloadTable(errorMessage: (error?.description))
            }
            reachability.stopNotifier()
            
            
        }
        reachability.whenUnreachable = { _ in
            Utility.showAlert(alertTitle: "Connection Error!", alertMessage: "No internet connection detected", controller: self)
            self.reachability.stopNotifier()
            
        }
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    
    
      // MARK: - Hide Progress Hud and Show data
    func  hideProgressAndReloadTable(errorMessage:String?){
        if errorMessage != nil {
            Utility.showAlert(alertTitle: "Alert", alertMessage: errorMessage!, controller: self)
        }
        
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
            self.tableView.reloadData()
        }
        
    }
    
    // MARK: - Create Detail View Controller
    func getDetailViewController(){
        
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }
 
  
}


extension DetailViewController{
    
    func configureWebView(){
        
        let url = URL(string: nyTime.url!)!
        webView.load(URLRequest(url: url))
        
    }
    
    
    
}
