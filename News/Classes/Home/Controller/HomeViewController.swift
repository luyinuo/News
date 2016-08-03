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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func fetchData() {
        //http://c.m.163.com/nc/article/headline/T1348647853363/0-20.html
        
    }

}
