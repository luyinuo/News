//
//  ViewController.swift
//  News
//
//  Created by KevinLu on 16/8/3.
//  Copyright © 2016年 News. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        let btn = UIButton.init(type: .ContactAdd)
        self.view.addSubview(btn);
        btn.addTarget(self, action: #selector(clickBtn(_:)), forControlEvents: .TouchUpInside)
        btn.frame = CGRectMake(100, 100, 40, 40)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func clickBtn(sender :UIButton) {
        print("点击按钮")
        self.title = "点我";
    }

}

