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
        // Override point for customization after application launch.
        
        let mainVc = ZYCTabbarController()
        self.window = UIWindow()
        self.window?.frame = UIScreen.main.bounds
        self.window?.rootViewController = ZYCNavigationController(rootViewController: mainVc)
        self.window?.makeKeyAndVisible()
        
        return true
    }

}

