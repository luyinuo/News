//
//  HomeModel.swift
//  News
//
//  Created by KevinLu on 16/8/4.
//  Copyright © 2016年 News. All rights reserved.
//

import UIKit

class HomeModel: Reflect {
    var docid:String?
    var id:String?
    var img:String?
    var imgsrc:String?
    var imgnewextra:[ImgModel]?
    var recSource:String?
    var source:String?
    var photosetID:String?
    var replyCount:NSNumber?
    var replyid:String?
    var title:String?
    var priority:NSNumber?
    var lmodify:String?
    var boardid:String?
    
//    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
//        if key == "hasCover" {
//            self.hasCover = (value as! Int) != 0
//        }else if key == "hasImg" {
//            self.hasImg = (value as! Int) != 0
//        }else if key == "order" {
//            self.order = (value as! Int) != 0
//        }else if key == "hasIcon" {
//            self.hasIcon = (value as! Int) != 0
//        }
//        
//    }
}

class ADModel:Reflect {
    var title:String?
    var tag:String?
    var imgsrc:String?
    var subtitle:String?
    var url:String?
}
class ImgModel:Reflect {
    var imgsrc:String?
}
