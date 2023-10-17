//
//  HomeCorpusResourceCell.swift
//  swiftDemo
//
//  Created by weather on 2023/9/13.
//

import UIKit

class HomeCorpusResourceCell: BaseTableViewCell {

    var dataSource: [CorpusModel]? {
        didSet {
            if dataSource != nil {
                for _ in 0..<5 {
                    dataSource!.append(contentsOf: dataSource!)
                }
                collectionView.reloadData()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: { [weak self] in
                    self?.collectionView.scrollToItem(at: IndexPath(item: 20, section: 0), at: .left, animated: false)
                })
            }
        }
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = LineLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: UIDevice.kScreenWidth / 3, height: 220)
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HomeCorpusCell.self, forCellWithReuseIdentifier: "HomeCorpusCell")
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        return collectionView
    }()

    override func initUI() {
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
            make.height.equalTo(240).priority(999)
        }
    }

}

extension HomeCorpusResourceCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCorpusCell", for: indexPath) as? HomeCorpusCell
        cell?.model = dataSource?[indexPath.item] as CorpusModel?
        return cell!
    }
}
