//
//  AppDelegate.swift
//  swiftDemo
//
//  Created by weather on 2023/2/27.
//

import UIKit
import CYLTabBarController

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let mainVc = BaseTabBarController()
        self.window = UIWindow()
        self.window?.frame = UIScreen.main.bounds
        let nav = BaseNavigationController(rootViewController: mainVc)
        nav.isNavigationBarHidden = true
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        
        QYLog.sharedInstance.initLog()
        
        return true
    }

}

