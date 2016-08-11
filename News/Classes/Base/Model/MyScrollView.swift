//
//  MyScrollView.swift
//  News
//
//  Created by KevinLu on 16/8/11.
//  Copyright © 2016年 News. All rights reserved.
//

import UIKit

class MyScrollView: UIScrollView {

    override func setContentOffset(contentOffset: CGPoint, animated: Bool) {
        super.setContentOffset(contentOffset, animated: animated)
    }
    override func systemLayoutSizeFittingSize(targetSize: CGSize) -> CGSize {
        return super.systemLayoutSizeFittingSize(targetSize)
    }
}
