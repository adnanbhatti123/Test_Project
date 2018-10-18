//
//  NYTime.swift
//  Test_Project
//
//  Created by Muhammad Arslan Khalid on 17/10/2018.
//  Copyright © 2018 3s. All rights reserved.
//

import UIKit

class NYTime: NSObject {
    var title:String?
    var url:String?
    var detail:String?
    var writer:String?
    var imageUrl:String?
    var publishedDate:String?
    
    init(object:NSDictionary) {
      
        if let title = object.object(forKey: "title") as? String{
            self.title = title
        }
        
        if let detail = object.object(forKey: "abstract") as? String{
            self.detail = detail
        }
        
        if let writer = object.object(forKey: "byline") as? String{
            self.writer = writer
        }
        
        if let url = object.object(forKey: "url") as? String{
            self.url = url
        }
        
        if let publishedDate = object.object(forKey: "published_date") as? String{
            self.publishedDate = publishedDate
        }
        
        
       if let mediaList = object.object(forKey: "media") as? [Any]
       {
       
            let mediaObject = mediaList[0] as? NSDictionary
           if let mediaMetadata = mediaObject?.object(forKey: "media-metadata") as? [Any]
           {
            
                for metaDataObj  in mediaMetadata {
                    if (((metaDataObj as! NSDictionary).object(forKey: "format") as? String) == "Standard Thumbnail"){
                        self.imageUrl = (metaDataObj as! NSDictionary).object(forKey: "url") as? String
                        break
                    }
                    
                }
            
            
            }
  }
     
        
      
    }
    
}
