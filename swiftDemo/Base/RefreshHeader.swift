//
//  RefreshHeader.swift
//  swiftDemo
//
//  Created by weather on 2023/8/10.
//

import UIKit
import MJRefresh

class RefreshHeader: MJRefreshStateHeader {
//    lazy var indicatorView: UIImageView = {
//        let indicatorView = UIImageView()
//        indicatorView.image = UIImage(named: "refresh_loading")
//        return indicatorView
//    }()
    
    override func prepare() {
        super.prepare()
        mj_h = 40
//        addSubview(indicatorView)
//        stateLabel?.isHidden = true
    }
    
//    override func placeSubviews() {
//        super.placeSubviews()
//
//        indicatorView.bounds.size = CGSize(width: 20, height: 20)
//        indicatorView.center = CGPoint(x: mj_w*0.5, y: mj_h*0.5)
//
//    }
//
//    override var state: MJRefreshState {
//        didSet {
//            switch state {
//            case .idle:
//                stopAnimation()
//            case .pulling:
//                stopAnimation()
//            case .refreshing:
//                startAnimation()
//            case .willRefresh:
//                stopAnimation()
//            default:
//                break
//            }
//        }
//    }
//
//    func startAnimation () {
//        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
//        animation.fromValue = 0
//        animation.toValue = Double.pi*2
//        animation.repeatCount = HUGE
//        animation.duration = 0.5
//        animation.isRemovedOnCompletion = false
//        indicatorView.layer.add(animation, forKey: "rotation")
//    }
//
//    func stopAnimation() {
//        indicatorView.layer.removeAnimation(forKey: "rotation")
//    }
}
