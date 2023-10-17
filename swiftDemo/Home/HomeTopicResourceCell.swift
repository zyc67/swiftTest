//
//  HomeTopicResourceCell.swift
//  swiftDemo
//
//  Created by weather on 2023/8/30.
//

import UIKit

class HomeTopicResourceCell: BaseTableViewCell {
    
    var dataSource: [TopicModel]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = NonFullScreenLayout()
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: UIDevice.kScreenWidth - 100, height: 44)
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HomeTopicCell.self, forCellWithReuseIdentifier: "HomeTopicCell")
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 100)
        return collectionView
    }()

    override func initUI() {
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
            make.height.equalTo(172).priority(999)
        }
    }

}

extension HomeTopicResourceCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeTopicCell", for: indexPath) as? HomeTopicCell
        cell?.model = dataSource?[indexPath.item] as TopicModel?
        return cell!
    }
}
