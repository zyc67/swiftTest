//
//  LineLayout.swift
//  swiftDemo
//
//  Created by weather on 2023/9/14.
//

import UIKit

class LineLayout: UICollectionViewFlowLayout {
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func prepare() {
        super.prepare()
        scrollDirection = .horizontal
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        var rect: CGRect = CGRectZero
        rect.origin = proposedContentOffset
        rect.size = collectionView!.frame.size
        let attris = layoutAttributesForElements(in: rect)
        guard let attris = attris else {
            return CGPointZero
        }
        let centerX = proposedContentOffset.x + collectionView!.frame.size.width * 0.5
        var offsetX = CGFLOAT_MAX
        for i in 0..<(attris.count) {
            let attri = attris[i]
            if abs(attri.center.x - centerX) < abs(offsetX) {
                offsetX = attri.center.x - centerX
            }
        }
        return CGPoint(x: proposedContentOffset.x + offsetX, y: proposedContentOffset.y)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var rect: CGRect = CGRectZero
        rect.origin = collectionView!.contentOffset
        rect.size = collectionView!.frame.size
        let attris = super.layoutAttributesForElements(in: rect)
        guard let attris = attris else {
            return []
        }
        let centerX = collectionView!.contentOffset.x + collectionView!.frame.size.width * 0.5
        let maxDistance = collectionView!.frame.size.width + self.itemSize.width * 0.2
        for i in 0..<(attris.count) {
            let attri = attris[i]
            // 如果不在屏幕上,直接跳过
            if !CGRectIntersectsRect(rect, attri.frame) {
                continue
            }
            // 差距越小, 缩放比例越大
            let progress = abs(attri.center.x - centerX) / maxDistance
            let scale = 1 - progress
//            let scale = abs(1 - abs(attri.center.x - centerX) * 2 / collectionView!.frame.size.width);
            attri.transform = CGAffineTransformMakeScale(scale, scale)
            attri.zIndex = Int(-abs(attri.center.x - centerX));
        }
        return attris
    }
}
