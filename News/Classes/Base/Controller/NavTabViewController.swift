//
//  NavTabViewController.swift
//  News
//
//  Created by KevinLu on 16/8/10.
//  Copyright © 2016年 News. All rights reserved.
//

import UIKit

class NavTabViewController: UIViewController {
    lazy var titleArray:[TitleModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(){
            self.setupTabView()
        }
        
    }
    /**
     初始化顶部TabView
     */
    func setupTabView() {
        let tabTitleView = TabBarView()
        tabTitleView.initWithTitleArray(self.titleArray)
        self.view.addSubview(tabTitleView)
        tabTitleView.mas_remakeConstraints { (make) in
            make.top.equalTo()(self.view).offset()(64)
            make.left.equalTo()(self.view)
            make.right.equalTo()(self.view)
            make.height.equalTo()(50)
        }
    }
    /**
     获取数据
     */
    func fetchData( success:()->()) {
        let url = "http://c.m.163.com/nc/topicset/ios/subscribe/manage/listspecial.html"
        HttpTool.sharedInstance.apiFetchData(url) { (response, responseObject, error) in
            if error == nil {
                let array = (responseObject as? NSDictionary)?["tList"] as? NSArray
                if let _ = array {
                    for dic in array! {
                        let model = TitleModel.parse(dict: dic as! NSDictionary)
                        self.titleArray .append(model)
                    }
                }
                success()
            }
        }
        
    }
    
    
}
