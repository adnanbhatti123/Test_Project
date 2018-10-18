//
//  NYTimeApiTest.swift
//  NYTimeApiTest
//
//  Created by Muhammad Arslan Khalid on 18/10/2018.
//  Copyright © 2018 3s. All rights reserved.
//

import XCTest
@testable import Test_Project


class NYTimeApiTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
     }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    
      // MARK: - Unit Testing for Api Response
    func testExampleWithAllsections() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let promise = expectation(description: "Status code: 200")

        
        let networkObject = NetworkOperations.sharedInstance
        let urlString = NSString(format: "%@%@/%@/%@.json?%@", Constants.base_url,Constants.mostViewedApi,"All-Sections","7",Constants.apiKey)
        let requestObject = networkObject.getUrlRequestObject(urlString: urlString, httpHeaderField: "Content-Type", HttpHeaderFieldValue: "application/x-www-form-urlencoded", httpMethod: "GET", timeoutIntervial: 30.00)
        let session = networkObject.getSessionObject()
        networkObject.createUrlTask(requestObject: requestObject, session: session, onSuccess: { (nyObject) in
            
            promise.fulfill()

            
 
        }) { (error) in
            XCTFail("Status code: \(String(describing: error?.description))")

         }
        
         // 3
        waitForExpectations(timeout: 5, handler: nil)
    
    }

    
    
    func testExampleWithUsSections() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let promise = expectation(description: "Status code: 200")
        
        
        let networkObject = NetworkOperations.sharedInstance
        let urlString = NSString(format: "%@%@/%@/%@.json?%@", Constants.base_url,Constants.mostViewedApi,"U.S.","7",Constants.apiKey)
        let requestObject = networkObject.getUrlRequestObject(urlString: urlString, httpHeaderField: "Content-Type", HttpHeaderFieldValue: "application/x-www-form-urlencoded", httpMethod: "GET", timeoutIntervial: 30.00)
        let session = networkObject.getSessionObject()
        networkObject.createUrlTask(requestObject: requestObject, session: session, onSuccess: { (nyObject) in
            
            promise.fulfill()
            
            
            
        }) { (error) in
            XCTFail("Status code: \(String(describing: error?.description))")
            
        }
        
        // 3
        waitForExpectations(timeout: 5, handler: nil)
        
    }
    
    
    
    func testExampleWithPeriodNo1() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let promise = expectation(description: "Status code: 200")
        
        
        let networkObject = NetworkOperations.sharedInstance
        let urlString = NSString(format: "%@%@/%@/%@.json?%@", Constants.base_url,Constants.mostViewedApi,"U.S.","1",Constants.apiKey)
        let requestObject = networkObject.getUrlRequestObject(urlString: urlString, httpHeaderField: "Content-Type", HttpHeaderFieldValue: "application/x-www-form-urlencoded", httpMethod: "GET", timeoutIntervial: 30.00)
        let session = networkObject.getSessionObject()
        networkObject.createUrlTask(requestObject: requestObject, session: session, onSuccess: { (nyObject) in
            
            promise.fulfill()
            
            
            
        }) { (error) in
            XCTFail("Status code: \(String(describing: error?.description))")
            
        }
        
        // 3
        waitForExpectations(timeout: 5, handler: nil)
        
    }
    
    
    func testExampleWithPeriodNo2() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let promise = expectation(description: "Status code: 200")
        
        
        let networkObject = NetworkOperations.sharedInstance
        let urlString = NSString(format: "%@%@/%@/%@.json?%@", Constants.base_url,Constants.mostViewedApi,"U.S.","2",Constants.apiKey)
        let requestObject = networkObject.getUrlRequestObject(urlString: urlString, httpHeaderField: "Content-Type", HttpHeaderFieldValue: "application/x-www-form-urlencoded", httpMethod: "GET", timeoutIntervial: 30.00)
        let session = networkObject.getSessionObject()
        networkObject.createUrlTask(requestObject: requestObject, session: session, onSuccess: { (nyObject) in
            
            promise.fulfill()
            
            
            
        }) { (error) in
            XCTFail("Status code: \(String(describing: error?.description))")
            
        }
        
        // 3
        waitForExpectations(timeout: 5, handler: nil)
        
    }

}
