//
//  TitleModel.swift
//  News
//
//  Created by KevinLu on 16/8/10.
//  Copyright © 2016年 News. All rights reserved.
//

import UIKit

/*
 "template": "normal1",
 "topicid": "00040BGE",
 "hasCover": false,
 "alias": "The Truth",
 "subnum": "超过1000万",
 "recommendOrder": 0,
 "isNew": 0,
 "img": "http://img2.cache.netease.com/m/newsapp/banner/zhenhua.png",
 "isHot": 0,
 "hasIcon": true,
 "cid": "C1348654575297",
 "recommend": "0",
 "headLine": false,
 "color": "",
 "bannerOrder": 105,
 "tname": "独家",
 "ename": "zhenhua",
 "showType": "comment",
 "special": 0,
 "tid": "T1370583240249"
 */
class TitleModel: Reflect {
    var template:String?
    var topicid:String?
    var hasCover:Bool?
    var alias:String?
    var subnum:String?
    var recommendOrder:NSNumber?
    var isNew:Bool?
    var img:String?
    var isHot:Bool?
    var hasIcon:Bool?
    var cid:String?
    var recommend:String?
    var headLine:Bool?
    var color:String?
    var bannerOrder:NSNumber?
    var tname:String?
    var ename:String?
    var showType:String?
    var special:NSNumber?
    var tid:String?
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        if key == "hasCover" {
            self.hasCover = (value as! Int) != 0
        }else if key == "isNew" {
            self.isNew = (value as! Int) != 0
        }else if key == "isHot" {
            self.isHot = (value as! Int) != 0
        }else if key == "hasIcon" {
            self.hasIcon = (value as! Int) != 0
        }else if key == "headLine" {
            self.headLine = (value as! Int) != 0
        }
        
    }
}
