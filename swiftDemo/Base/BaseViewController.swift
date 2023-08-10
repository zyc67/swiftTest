//
//  BaseViewController.swift
//  swiftDemo
//
//  Created by weather on 2023/8/10.
//

import UIKit

class BaseViewController: UIViewController {
    
    lazy var navigationView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    lazy var leftButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "back_black_icon"), for: .normal)
        btn.setImage(UIImage(named: "back_black_icon"), for: .highlighted)
        btn.addTarget(self, action: #selector(backClick), for: .touchUpInside)
        return btn
    }()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#333333")
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        return label
    }()
    lazy var rightButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.addTarget(self, action: #selector(rightClick), for: .touchUpInside)
        return btn
    }()
    
    var navigationHide = false {
        didSet {
            navigationView.isHidden = navigationHide
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(navigationView)
        navigationView.snp.makeConstraints { make in
            make.left.top.right.equalTo(view)
            make.height.equalTo(UIDevice.navigationFullHeight)
        }
        
        navigationView.addSubview(leftButton)
        leftButton.snp.makeConstraints { make in
            make.left.bottom.equalTo(0)
            make.width.equalTo(52)
            make.height.equalTo(44)
        }
        
        navigationView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(60)
            make.right.equalTo(-60)
            make.centerY.equalTo(leftButton)
        }
        
        navigationView.addSubview(rightButton)
        rightButton.snp.makeConstraints { make in
            make.right.bottom.equalTo(0)
            make.width.equalTo(52)
            make.height.equalTo(44)
        }
    }
}

extension BaseViewController {
    @objc func backClick() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func rightClick() {
       
    }
}
