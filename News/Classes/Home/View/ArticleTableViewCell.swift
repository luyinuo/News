//
//  ArticleTableViewCell.swift
//  News
//
//  Created by KevinLu on 16/8/8.
//  Copyright © 2016年 News. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    let imgView:UIImageView = UIImageView.init()
    let titleLabel:UILabel = UILabel.init()
    let sourceLabel:UILabel = UILabel.init()
    let followCountLabel:UILabel = UILabel.init()
    lazy var str:String = {
        return ""
    }()
    var model:HomeModel?{
        
        willSet {
            print("model will set ")
            self.titleLabel.text = newValue!.title
            self.sourceLabel.text = newValue!.source
    
            if let count = newValue!.replyCount {
                
                if count.integerValue > 10000 {
                    let str = String(format: "%.2f",count.floatValue/10000)
                    self.followCountLabel.text = "\(str)万跟帖"
                }else{
                    self.followCountLabel.text = "\(count)跟帖"
                }
                
            }else{
                self.followCountLabel.text = ""
            }
            self.imgView.sd_setImageWithURL(NSURL.init(string: newValue!.imgsrc!))
        }
        didSet {
            print("model did set ")
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    required override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func commonInit() {
        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont.systemFontOfSize(13)
        sourceLabel.font = UIFont.systemFontOfSize(12)
        followCountLabel.font = UIFont.systemFontOfSize(12)
        self.contentView.addSubview(imgView)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(sourceLabel)
        self.contentView.addSubview(followCountLabel)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imgView.mas_remakeConstraints { (make) in
            make.left.equalTo()(self.contentView).offset()(10)
            make.top.equalTo()(self.contentView).offset()(10)
            make.bottom.equalTo()(self.contentView).offset()(-10)
            make.width.equalTo()(120)
        }
        titleLabel.mas_remakeConstraints { (make) in
            make.left.equalTo()(self.imgView.mas_right).offset()(10)
            make.right.equalTo()(self.contentView.mas_right).offset()(-10)
            make.top.equalTo()(self.imgView.mas_top)
        }
        sourceLabel.mas_remakeConstraints { (make) in
            make.left.equalTo()(self.imgView.mas_right).offset()(10)
            make.bottom.equalTo()(self.imgView.mas_bottom)
        }
        followCountLabel.mas_remakeConstraints { (make) in
            make.right.equalTo()(self.contentView).offset()(-10)
            make.bottom.equalTo()(self.imgView.mas_bottom)
        }
        
    }
    
}
