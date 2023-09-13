//
//  NonFullScreenLayout.swift
//  swiftDemo
//
//  Created by weather on 2023/8/30.
//

import UIKit

class NonFullScreenLayout: UICollectionViewFlowLayout {
    
    var lastOffset = CGPointZero
    
    // velocity.x == 0 拖动，!= 0 滑动
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        // 分页的宽度
        let pageWidth = self.itemSize.width + self.minimumLineSpacing - self.collectionView!.contentInset.left
        // 目标位移点距离当前点距离的绝对值
        let offsetForCurrentPointX: CGFloat = abs(proposedContentOffset.x - lastOffset.x)

        // 判断当前滑动方向，向左 true, 向右 fasle
        let direction: Bool = (proposedContentOffset.x - lastOffset.x) > 0
        
        var newProposedContentOffset: CGPoint = CGPointZero
        
        if offsetForCurrentPointX > pageWidth/8.0 {
            // 分页因子，用于计算滑过的cell数量
            var pageFactor = abs(NSInteger(offsetForCurrentPointX / pageWidth))
            //设置 pageFactor 的上限为2，防止滑动速率过大，导致翻页过多 也可以不限制
            pageFactor = pageFactor < 1 ? 1: (pageFactor < 3 ? 1: 2)
            
            let pageOffsetX: CGFloat = pageWidth * CGFloat(pageFactor)
            newProposedContentOffset = CGPoint(x: lastOffset.x + (direction ? pageOffsetX : -pageOffsetX), y: proposedContentOffset.y)
        } else {
            // 滚动距离小于翻页步距，则不进行翻页
            newProposedContentOffset = CGPoint(x: lastOffset.x, y: lastOffset.y)
        }
        
        lastOffset.x = newProposedContentOffset.x
        return newProposedContentOffset
    }
}
