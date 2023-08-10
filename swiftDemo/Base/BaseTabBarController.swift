//
//  BaseTabBarController.swift
//  swiftDemo
//
//  Created by weather on 2023/8/10.
//

import UIKit
import CYLTabBarController

class BaseTabBarController: CYLTabBarController {
    lazy var publishButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "tabbar_publish"), for: .normal)
        btn.setImage(UIImage(named: "tabbar_publish"), for: .selected)
        btn.setImage(UIImage(named: "tabbar_publish"), for: .highlighted)
        btn.frame = CGRect(x: UIDevice.kScreenWidth/2.0-26, y: 5, width: 52, height: 39)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarItemsAttributes = attrs()
        self.viewControllers = vcs()
    
        UITabBar.appearance().backgroundColor = UIColor(hexString: "#FAFAFA")
        
        self.cyl_tabBarController.tabBarHeight = UIDevice.tabbarFullHeight;
        
        let normalAttrs = [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#666666"), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)]
        let selectedAttrs = [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#FA243C"), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)]
     
        if #available(iOS 13.0, *) {
            let inlineLayoutAppearance = UITabBarItemAppearance()
            inlineLayoutAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3.5)
            inlineLayoutAppearance.selected.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3.5)
            inlineLayoutAppearance.normal.titleTextAttributes = normalAttrs as [NSAttributedString.Key : Any]
            inlineLayoutAppearance.selected.titleTextAttributes = selectedAttrs as [NSAttributedString.Key : Any]
            let standardAppearance = UITabBarAppearance()
            standardAppearance.stackedLayoutAppearance = inlineLayoutAppearance
            self.tabBar.standardAppearance = standardAppearance
        } else {
            let tabBarItem = UITabBarItem.appearance()
            tabBarItem.setTitleTextAttributes(normalAttrs as [NSAttributedString.Key : Any], for: .normal)
            tabBarItem.setTitleTextAttributes(selectedAttrs as [NSAttributedString.Key : Any], for: .selected)
        }
        
        self.tabBar.addSubview(self.publishButton)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.selectedIndex = tabBar.items?.firstIndex(of: item) ?? 0
    }
    
    override func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
    func vcs() -> [UIViewController] {
        let home = BaseNavigationController(rootViewController: HomeViewController())
        let clubView = BaseNavigationController(rootViewController: ClubViewController())
        let publish = BaseNavigationController(rootViewController: PublishViewController())
        let message = BaseNavigationController(rootViewController: MessageViewController())
        let me = BaseNavigationController(rootViewController: MeViewController())
        return [home, clubView, publish, message, me]
    }
    
    func attrs() -> [[String: String]] {
        let home = [
            CYLTabBarItemTitle: "首页",
            CYLTabBarItemImage: "tabbar_donate_normal",
            CYLTabBarItemSelectedImage : "tabbar_donate_select",
        ]
        
        let communityView = [
            CYLTabBarItemTitle : "时光",
            CYLTabBarItemImage : "tabbar_community_normal",
            CYLTabBarItemSelectedImage : "tabbar_community_select",
        ]
        
        let publish = [
            CYLTabBarItemTitle : "",
            CYLTabBarItemImage : "",
            CYLTabBarItemSelectedImage : "",
        ]
        
        let message = [
            CYLTabBarItemTitle : "消息",
            CYLTabBarItemImage : "tabbar_message_normal",
            CYLTabBarItemSelectedImage : "tabbar_message_select",
        ]
        
        let me = [
            CYLTabBarItemTitle : "我的",
            CYLTabBarItemImage : "tabbar_mine_normal",
            CYLTabBarItemSelectedImage : "tabbar_mine_select",
        ]
        
        return [home, communityView, publish, message, me]
    }


}
