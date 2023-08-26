//
//  RefreshFooter.swift
//  swiftDemo
//
//  Created by weather on 2023/8/10.
//

import UIKit
import MJRefresh

class RefreshFooter: MJRefreshAutoNormalFooter {
    override func prepare() {
        super.prepare()
//        setTitle("正在刷新", for: .refreshing)
//        setTitle("主人，我也是有底线的～", for: .noMoreData)
//        stateLabel?.font = UIFont.systemFont(ofSize: 12)
//        stateLabel?.textColor = UIColor(hexString: "#A7A7A7")
    }
}
