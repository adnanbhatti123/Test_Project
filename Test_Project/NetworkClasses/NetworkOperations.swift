//
//  NetworkOperations.swift
//  Test_Project
//
//  Created by Muhammad Arslan Khalid on 17/10/2018.
//  Copyright © 2018 3s. All rights reserved.
//

import UIKit

class NetworkOperations: NSObject {
    // MARK: - User Blocks
    typealias FailureBlock = (NSError?) -> Void
    typealias TSuccessBlock = (NSDictionary?) -> Void
    typealias TSuccessBlockArray = (NSArray?) -> Void
    
     // MARK: - Create Shared Network Object
    struct Static {
        static var onceToken: Int = 0
        static var instance: NetworkOperations? = nil
    }
    
    private static var __once: () = {
        Static.instance = NetworkOperations()
    }()
    
 
    class var sharedInstance: NetworkOperations {
        _ = NetworkOperations.__once
        return Static.instance!
    }
    
     
    func getUrlRequestObject(urlString:NSString, httpHeaderField:String, HttpHeaderFieldValue:String, httpMethod:String, timeoutIntervial:TimeInterval) -> NSMutableURLRequest{
        let url = NSURL(string: urlString as String)
        let request = NSMutableURLRequest(url: url! as URL)
        request.httpMethod = httpMethod;
        request.addValue(HttpHeaderFieldValue, forHTTPHeaderField: HttpHeaderFieldValue);
        request.timeoutInterval = timeoutIntervial;
        return request
    }
    
    func getSessionObject() -> URLSession{
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        return session
    }
    
    func createUrlTask(requestObject:NSMutableURLRequest , session:URLSession,onSuccess: @escaping TSuccessBlock , onFailure: @escaping FailureBlock) {
        
        
        let task = session.dataTask(with: requestObject as URLRequest, completionHandler: {(data, response, error) in
            if(error==nil)
            {
                
                do{
                    let nyTimesObjects = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                    onSuccess(nyTimesObjects)
                }
                catch{
                    
                }
            }
            else
            {
                onFailure(error! as NSError)
            }
            
        });
        
        // do whatever you need with the task e.g. run
        task.resume()
        
    }
    
    
}
