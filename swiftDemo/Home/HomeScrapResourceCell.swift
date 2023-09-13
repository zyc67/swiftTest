//
//  HomeScrapResourceCell.swift
//  swiftDemo
//
//  Created by weather on 2023/9/1.
//

import UIKit

class HomeScrapResourceCell: BaseTableViewCell {

    var dataSource: [ScrapModel]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = HorizontalLayout(rowCount: 2, columnCount: 3)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: UIDevice.kScreenWidth / 3, height: 80)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HomeScrapCell.self, forCellWithReuseIdentifier: "HomeScrapCell")
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        return collectionView
    }()

    override func initUI() {
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
            make.height.equalTo(180)
        }
    }
}

extension HomeScrapResourceCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeScrapCell", for: indexPath) as? HomeScrapCell
        cell?.model = dataSource?[indexPath.item] as ScrapModel?
        return cell!
    }
}
