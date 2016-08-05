//
//  HomeViewController.swift
//  News
//
//  Created by KevinLu on 16/8/3.
//  Copyright © 2016年 News. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        let view1 = UIView()
        view1.backgroundColor = UIColor.blueColor()
        self.view .addSubview(view1)
        view1.mas_remakeConstraints { (make) in
            make.center.equalTo()
            make.width.equalTo()(100)
            make.height.equalTo()(100)
        }
        fetchData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func fetchData() {
        //http://c.m.163.com/nc/article/headline/T1348647853363/0-20.html
        /*
         NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
         AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
         
         NSURL *URL = [NSURL URLWithString:@"http://httpbin.org/get"];
         NSURLRequest *request = [NSURLRequest requestWithURL:URL];
         
         NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
         if (error) {
         NSLog(@"Error: %@", error);
         } else {
         NSLog(@"%@ %@", response, responseObject);
         }
         }];
         [dataTask resume];
         */
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let mananger  = AFURLSessionManager.init(sessionConfiguration: configuration)
        let url = NSURL.init(string: "http://c.m.163.com/nc/article/headline/T1348647853363/0-20.html")
        let request = NSURLRequest.init(URL: url!)
        let dataTask = mananger.dataTaskWithRequest(request) { (response, responseObject, error) in
            if(error != nil){
                print("\(error)")
            }else{
                let dic = responseObject as? NSDictionary//["T1348647853363"]
                let array = dic?["T1348647853363"] as? NSArray
                
                let homeModel:HomeModel = HomeModel.parse(dict:(array?[0] as? NSDictionary)!)
                print("homemodel digest ==  \(homeModel.post_id!)")
            }
        }
        dataTask.resume()
    }

}
