//
//  AppDelegate.swift
//  News
//
//  Created by KevinLu on 16/8/3.
//  Copyright © 2016年 News. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let tabController = UITabBarController()
        let vc_1 = HomeViewController()
        let vc_2 = NavTabViewController()
        let vc_3 = ViewController()
        let vc_4 = ViewController()
        let vc_5 = ViewController()
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.init(red: 39/255.0, green: 38/255.0, blue: 54/255.0, alpha: 1)], forState:.Normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.init(red: 86/255.0, green: 171/255.0, blue: 228/255.0, alpha: 1)], forState:.Selected)
        vc_1.title = "首页"
        vc_1.tabBarItem.image = (UIImage.init(named: "home_nomal"))!.imageWithRenderingMode(.AlwaysOriginal)
        vc_1.tabBarItem.selectedImage = UIImage.init(named: "home")!.imageWithRenderingMode(.AlwaysOriginal)
        vc_2.title = "图片"
        vc_2.tabBarItem.image = UIImage.init(named: "img_nomal")!.imageWithRenderingMode(.AlwaysOriginal)
        vc_2.tabBarItem.selectedImage = UIImage.init(named: "img")!.imageWithRenderingMode(.AlwaysOriginal)
        vc_3.title = "视频"
        vc_3.tabBarItem.image = UIImage.init(named: "video_nomal")!.imageWithRenderingMode(.AlwaysOriginal)
        vc_3.tabBarItem.selectedImage = UIImage.init(named: "video")!.imageWithRenderingMode(.AlwaysOriginal)
        vc_4.title = "私信"
        vc_4.tabBarItem.image = UIImage.init(named: "sixin_nomal")!.imageWithRenderingMode(.AlwaysOriginal)
        vc_4.tabBarItem.selectedImage = UIImage.init(named: "sixin")!.imageWithRenderingMode(.AlwaysOriginal)
        vc_5.title = "更多"
        vc_5.tabBarItem.image = UIImage.init(named: "me_nomal")!.imageWithRenderingMode(.AlwaysOriginal)
        vc_5.tabBarItem.selectedImage = UIImage.init(named: "me")!.imageWithRenderingMode(.AlwaysOriginal)
        tabController.addChildViewController(vc_1)
        tabController.addChildViewController(vc_2)
        tabController.addChildViewController(vc_3)
        tabController.addChildViewController(vc_4)
        tabController.addChildViewController(vc_5)
        let navController = UINavigationController.init(rootViewController: tabController)
        
        window = UIWindow.init()
        window!.rootViewController = navController
        window!.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

