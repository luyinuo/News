//
//  HomeViewController.swift
//  News
//
//  Created by KevinLu on 16/8/3.
//  Copyright © 2016年 News. All rights reserved.
//

import UIKit
import AFNetworking
import XWSwiftRefresh
class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let ArticleCellIdentifier = "ArticleCell"
    let tableView:UITableView = UITableView.init()
    var indexPage = 0
    var maxnum = 20
    var dataSource:[HomeModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        setupTableView()
        
        fetchData()
    }
    func setupTableView() {
        self.view .addSubview(tableView)
        tableView.headerView = XWRefreshNormalHeader(target: self, action: #selector(HomeViewController.fetchData))
        tableView.footerView = XWRefreshAutoNormalFooter(target: self ,action: #selector(HomeViewController.fetchMoreData))
        tableView.mas_remakeConstraints { make in
            make.left.equalTo()(self.view)
            make.right.equalTo()(self.view)
            make.top.equalTo()(self.view)
            make.bottom.equalTo()(-50)
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView .registerClass(ArticleTableViewCell.self, forCellReuseIdentifier: ArticleCellIdentifier)
    }
    
    func fetchData() {
        dataSource.removeAll()
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let mananger  = AFURLSessionManager.init(sessionConfiguration: configuration)
        let url = NSURL.init(string: "http://c.m.163.com/nc/article/headline/T1348647853363/0-20.html")
        let request = NSURLRequest.init(URL: url!)
        let dataTask = mananger.dataTaskWithRequest(request) { (response, responseObject, error) in
            if(error != nil){
                print("\(error)")
            }else{
                self.indexPage = 20
                if ((self.tableView.headerView?.isRefreshing) != nil) {
                    self.tableView.headerView?.endRefreshing()
                }
                let dic = responseObject as? NSDictionary//["T1348647853363"]
                let array = dic?["T1348647853363"] as? NSArray//
                for dic in array! {
                    let model:HomeModel =  HomeModel.parse(dict: (dic as? NSDictionary)!)
                    self.dataSource.append(model)
                }
                self.tableView.reloadData()
            }
        }
        dataTask.resume()
    }
    func fetchMoreData(){
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let mananger  = AFURLSessionManager.init(sessionConfiguration: configuration)
        let url = NSURL.init(string:String(format:  "http://c.m.163.com/nc/article/headline/T1348647853363/%i-%i.html",indexPage+maxnum,maxnum))
        let request = NSURLRequest.init(URL: url!)
        let dataTask = mananger.dataTaskWithRequest(request) { (response, responseObject, error) in
            if(error != nil){
                print("\(error)")
            }else{
                self.indexPage += self.maxnum
                if ((self.tableView.footerView?.isRefreshing) != nil) {
                    self.tableView.footerView?.endRefreshing()
                }
                let dic = responseObject as? NSDictionary//["T1348647853363"]
                let array = dic?["T1348647853363"] as? NSArray//
                for dic in array! {
                    let model:HomeModel =  HomeModel.parse(dict: (dic as? NSDictionary)!)
                    self.dataSource.append(model)
                }
                self.tableView.reloadData()
            }
        }
        dataTask.resume()
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(ArticleCellIdentifier, forIndexPath: indexPath) as! ArticleTableViewCell
        guard dataSource.count > 0 else {
            return cell
        }
        let model = dataSource[indexPath.row]
        
        cell.model = model
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
}
