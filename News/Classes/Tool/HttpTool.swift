//
//  HttpTool.swift
//  News
//
//  Created by KevinLu on 16/8/3.
//  Copyright © 2016年 News. All rights reserved.
//

import UIKit
import AFNetworking

class HttpTool: NSObject {
    static let sharedInstance = HttpTool()
    private override init() {
        
    }
    func test() {
        print("just print hello...")
    }
    func apiFetchData(url:String,success:(response:NSURLResponse, responseObject:AnyObject?,error:NSError?)-> ()){
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let mananger  = AFURLSessionManager.init(sessionConfiguration: configuration)
        let url = NSURL.init(string: url)
        let request = NSURLRequest.init(URL: url!)
        let dataTask = mananger.dataTaskWithRequest(request) { (response, responseObject, error) in
            success(response: response,responseObject: responseObject, error: error)
        }
        dataTask.resume()
    }
}
