//
//  HorizontalLayout.swift
//  swiftDemo
//
//  Created by weather on 2023/9/11.
//

import UIKit

class HorizontalLayout: UICollectionViewFlowLayout {
    // 行
    var rowCount: Int
    // 列
    var columnCount: Int
    // 总数
    var totalCount: Int = 0
    
    init(rowCount: Int, columnCount: Int) {
        self.rowCount = rowCount
        self.columnCount = columnCount
        super.init()
        scrollDirection = .horizontal
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var allAttris: [UICollectionViewLayoutAttributes] = {
        let allAttris: [UICollectionViewLayoutAttributes] = []
        return allAttris
    }()
    
    override func prepare() {
        super.prepare()
        totalCount = collectionView?.numberOfItems(inSection: 0) ?? 0
        if totalCount == 0 {
            return
        }
        let row = ceil(CGFloat(totalCount) / CGFloat(columnCount))
        if Int(row) < rowCount { // 实际行数小于传过来的行数就重置
            rowCount = Int(row)
        }
        allAttris.removeAll()
        for i in 0..<totalCount {
            let indexPath = IndexPath(item: i, section: 0)
            guard let attris = layoutAttributesForItem(at: indexPath) else { return }
            allAttris.append(attris)
        }
    }
    
    override var collectionViewContentSize: CGSize {
        if totalCount == 0 {
            return CGSizeZero
        }
        let page = CGFloat(totalCount) / CGFloat(rowCount * columnCount)
        return CGSize(width: (collectionView?.frame.size.width ?? 0) * ceil(page), height: 0)
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        /*
            0   2   4   6   8           0   1   2   6   7   8
                                --->
            1   3   5   7   9           3   4   5   9
         
         
            i   0   1   2   3   4   5   6   7   8   9
                0   2   4   1   3   5   6   8   10  7
            x   0   0   0   1   1   1   0   0   0   1
            y   0   1   2   0   1   2   3   4   5   3
         */
        
        let item = indexPath.item
        let page = item / (rowCount * columnCount)
        let x = item / columnCount - page * rowCount
        let y = item % columnCount + page * columnCount
//        print("x: \(x), y: \(y), z: \(page * rowCount * columnCount + y % 3 * rowCount + x)")
        let indexPathNew = IndexPath(item: y  * rowCount + x, section: indexPath.section)
        let attris = super.layoutAttributesForItem(at: indexPathNew)
        attris!.indexPath = indexPath
        return attris
    }
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return allAttris
    }
}
