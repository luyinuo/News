//
//  TabBarView.swift
//  News
//
//  Created by KevinLu on 16/8/10.
//  Copyright © 2016年 News. All rights reserved.
//

import UIKit

class TabBarView: UIView {
    private var scrollView:UIScrollView!
    private var rightBtn:UIButton!
    private var contentView:UIView!
    var titleArray:[TitleModel]?
    func initWithTitleArray(array:[TitleModel]) {
        titleArray = array
        scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.blueColor()
        scrollView.alwaysBounceHorizontal = true
        self .addSubview(scrollView)
        rightBtn = UIButton.init(type: .Custom)
        rightBtn.backgroundColor = UIColor.redColor()
        self.addSubview(rightBtn)
        contentView = UIView()
        contentView.backgroundColor = UIColor.greenColor()
        scrollView .addSubview(contentView)
        
        for i in 0 ..< array.count {
            let btn = UIButton.init(type: .Custom)
            let model = self.titleArray![i]
            btn.setTitle(model.tname, forState: .Normal)
            contentView.addSubview(btn)
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        scrollView.mas_remakeConstraints { (make) in
            make.left.equalTo()(self)
            make.top.equalTo()(self)
            make.bottom.equalTo()(self)
            make.right.equalTo()(self.rightBtn.mas_left)
        }
        rightBtn.mas_remakeConstraints { (make) in
            make.left.equalTo()(self.scrollView.mas_right)
            make.right.equalTo()(self)
            make.top.equalTo()(self)
            make.bottom.equalTo()(self)
            make.width.equalTo()(40)
        }
        contentView.mas_remakeConstraints { (make) in
            make.right.equalTo()(self.scrollView)
            make.top.equalTo()(self.scrollView)
            make.bottom.equalTo()(self.scrollView)
            make.left.equalTo()(self.scrollView)
            make.height.equalTo()(self.scrollView)
        }
        var lastView:UIButton?
        for i in 0 ..< contentView.subviews.count {
            let btn = contentView.subviews[i] as! UIButton
            if let _ = lastView {
                btn.mas_remakeConstraints({ (make) in
                    make.left.equalTo()(lastView!.mas_right).offset()(10)
                    make.top.equalTo()(self.contentView)
                    make.bottom.equalTo()(self.contentView)
                })
            }else {
                btn.mas_remakeConstraints({ (make) in
                    make.left.equalTo()(self.contentView).offset()(10)
                    make.top.equalTo()(self.contentView)
                    make.bottom.equalTo()(self.contentView)
                })

            }
            lastView = btn
        }
        lastView!.mas_updateConstraints { (make) in
            make.right.equalTo()(self.contentView).offset()(-10).priorityLow()
        }
    }

}
