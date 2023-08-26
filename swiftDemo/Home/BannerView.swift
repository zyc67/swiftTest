//
//  BannerView.swift
//  swiftDemo
//
//  Created by weather on 2023/8/21.
//

import UIKit
import FSPagerView

class BannerView: UIView {
    
    var dataSource: [ImageModel]? {
        didSet {
            pagerView.reloadData()
            pageControl.isHidden = dataSource?.count ?? 0 <= 1
            pageControl.numberOfPages = dataSource?.count ?? 0
            pagerView.isInfinite = dataSource?.count ?? 0 > 1
        }
    }
    
    var tapClick: ((ImageModel, Int) -> Void)?

    lazy var pagerView: FSPagerView = {
        let pagerView = FSPagerView()
//        pagerView.isInfinite = true
        pagerView.automaticSlidingInterval = 3
        pagerView.dataSource = self
        pagerView.delegate = self
        pagerView.layer.cornerRadius = 10
        pagerView.layer.masksToBounds = true
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "BannerViewCell")
        return pagerView
    }()
    
    lazy var pageControl: FSPageControl = {
        let pageControl = FSPageControl()
        pageControl.contentHorizontalAlignment = .right
        pageControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        pageControl.setFillColor(.red, for: .selected)
        pageControl.setFillColor(.blue, for: .normal)
        return pageControl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(pagerView)
        pagerView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        self.addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.right.bottom.equalTo(self)
            make.width.equalTo(80)
            make.height.equalTo(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BannerView: FSPagerViewDataSource, FSPagerViewDelegate {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        dataSource?.count ?? 0
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "BannerViewCell", at: index)
        if let model = dataSource?[index] {
            cell.imageView?.kf.setImage(with: URL(string: model.imgUrl))
            cell.imageView?.contentMode = .scaleAspectFill
        }
        
        return cell
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        pageControl.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        pageControl.currentPage = pagerView.currentIndex
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        if tapClick != nil {
            tapClick!(dataSource![index], index)
        }
    }
    
}
