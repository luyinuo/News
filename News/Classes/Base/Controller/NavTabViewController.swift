//
//  NavTabViewController.swift
//  News
//
//  Created by KevinLu on 16/8/10.
//  Copyright © 2016年 News. All rights reserved.
//

import UIKit
let kTitleIdentify = "kTitleIdentify"
class NavTabViewController: UIViewController ,UIScrollViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    lazy var titleArray:[TitleModel] = []
    var tabTitleView:TabBarView?
    var childControllers:[HomeViewController] = []
    var containnerView:UIView!
    var mainScrollView:UIScrollView!
    var collectionView:UICollectionView?
    let kCellIdentify = "collectionCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.automaticallyAdjustsScrollViewInsets = false
        let tempView = UIView()
        self.view.addSubview(tempView)
        self.setupCollectionView()
        fetchData(){
            self.setupTabView()
            self.initializedChildViewControllers()
            self.collectionView?.reloadData()
        }
        
        
    }
    override func viewWillAppear(animated: Bool) {
        self.performSelector(#selector(NavTabViewController.setScrollViewContentSize), withObject: nil, afterDelay: 0.5)
    }
    func setScrollViewContentSize(){
        
    }
    
    /**
     初始化子控制器
     */
    func initializedChildViewControllers() {
        
        for _ in 0..<self.titleArray.count {
            let viewController = HomeViewController()
            childControllers .append(viewController)
        }
    }
    /**
     初始化顶部TabView
     */
    func setupTabView() {
        tabTitleView = TabBarView()
        tabTitleView!.initWithTitleArray(self.titleArray)
        self.view.addSubview(tabTitleView!)
        tabTitleView!.mas_remakeConstraints { (make) in
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
        let array:NSArray? = NSUserDefaults.standardUserDefaults().objectForKey(kTitleIdentify) as? NSArray
        if let _ = array {
            for dic in array! {
                let model = TitleModel.parse(dict: dic as! NSDictionary)
                self.titleArray .append(model)
            }
            success()
        }else {
            HttpTool.sharedInstance.apiFetchData(APIHelper.apiGetTitleArray as String) { (response, responseObject, error) in
                if error == nil {
                    let array = (responseObject as? NSDictionary)?["tList"] as? NSArray
                    NSUserDefaults.standardUserDefaults().setObject(array, forKey: kTitleIdentify)
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
    

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.titleArray.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(kCellIdentify, forIndexPath: indexPath)
        let viewController = self.childControllers[indexPath.row]
        for subView in cell.contentView.subviews{
            subView.removeFromSuperview()
        }
        self.addChildViewController(viewController)
        cell.contentView.addSubview(viewController.view)
        view.frame = cell.bounds
        return cell
    }
    func setupCollectionView (){
        let collectionLayout = UICollectionViewFlowLayout.init()
        collectionLayout.scrollDirection = .Horizontal
        collectionLayout.minimumLineSpacing = 0
        collectionLayout.minimumInteritemSpacing = 0
        let frame = CGRectMake(0, 50+64, self.view.frame.width, self.view.frame.height-64-50)
        collectionLayout.itemSize = CGSizeMake(self.view.frame.width, self.view.frame.height)
        collectionView = UICollectionView.init(frame: frame, collectionViewLayout: collectionLayout)
        
        collectionView?.pagingEnabled = true
        collectionView?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: kCellIdentify)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = UIColor.whiteColor()
        collectionView?.showsHorizontalScrollIndicator = false
        self.view.addSubview(collectionView!)
    }
}
