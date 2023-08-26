//
//  HomeViewController.swift
//  swiftDemo
//
//  Created by weather on 2023/8/10.
//

import UIKit
import JXSegmentedView

class HomeViewController: BaseViewController {
    
    var segmentedDataSource: JXSegmentedBaseDataSource?
    let segmentedView = JXSegmentedView()
    lazy var listContainerView: JXSegmentedListContainerView! = {
        return JXSegmentedListContainerView(dataSource: self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationHide = true
        view.backgroundColor = .white
        
        //配置数据源
        let dataSource = JXSegmentedTitleDataSource()
        dataSource.isTitleColorGradientEnabled = true
        dataSource.titles = ["热门", "关注"]
        dataSource.titleNormalFont = UIFont.systemFont(ofSize: 15)
        dataSource.titleSelectedFont = UIFont.systemFont(ofSize: 20)
        dataSource.titleNormalColor = UIColor(hexString: "#333333")!
        dataSource.titleSelectedColor = UIColor(hexString: "#333333")!
        dataSource.isTitleZoomEnabled = true
        segmentedDataSource = dataSource
        //配置指示器
        let indicator = JXSegmentedIndicatorImageView()
        indicator.image = UIImage(named: "page_line_icon")
        indicator.indicatorWidth = 28
        indicator.indicatorHeight = 2
        indicator.verticalOffset = 8
        segmentedView.indicators = [indicator]
        
        //segmentedViewDataSource一定要通过属性强持有！！！！！！！！！
        segmentedView.dataSource = segmentedDataSource
        segmentedView.delegate = self
        view.addSubview(segmentedView)

        segmentedView.listContainer = listContainerView
        view.addSubview(listContainerView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        //处于第一个item的时候，才允许屏幕边缘手势返回
        navigationController?.interactivePopGestureRecognizer?.isEnabled = (segmentedView.selectedIndex == 0)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        //离开页面的时候，需要恢复屏幕边缘手势，不能影响其他页面
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        segmentedView.frame = CGRect(x: (UIDevice.kScreenWidth - 200) / 2, y: UIDevice.statusBarHeight, width: 200, height: UIDevice.navigationBarHeight)
        listContainerView.frame = CGRect(x: 0, y: UIDevice.navigationFullHeight, width: UIDevice.kScreenWidth, height: UIDevice.kScreenHeight - UIDevice.navigationFullHeight)
    }
}

extension HomeViewController: JXSegmentedViewDelegate {
    func segmentedView(_ segmentedView: JXSegmentedView, didSelectedItemAt index: Int) {
        if let dotDataSource = segmentedDataSource as? JXSegmentedDotDataSource {
            //先更新数据源的数据
            dotDataSource.dotStates[index] = false
            //再调用reloadItem(at: index)
            segmentedView.reloadItem(at: index)
        }

        navigationController?.interactivePopGestureRecognizer?.isEnabled = (segmentedView.selectedIndex == 0)
    }
}

extension HomeViewController: JXSegmentedListContainerViewDataSource {
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        if let titleDataSource = segmentedView.dataSource as? JXSegmentedBaseDataSource {
            return titleDataSource.dataSource.count
        }
        return 0
    }

    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        if index == 0 {
            return HomeHotViewController()
        }
        return HomeFocusViewController()
    }
}
