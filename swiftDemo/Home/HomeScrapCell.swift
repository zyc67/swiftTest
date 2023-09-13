//
//  HomeScrapCell.swift
//  swiftDemo
//
//  Created by weather on 2023/9/1.
//

import UIKit

class HomeScrapCell: BaseCollectionViewCell {
    var model: ScrapModel? {
        didSet {
            icon.kf.setImage(with: URL(string: model?.imgUrl ?? ""))
            nameLabel.text = model?.title
        }
    }
    
    lazy var icon: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFill
        icon.layer.cornerRadius = 8
        icon.layer.masksToBounds = true
        return icon
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 15)
        nameLabel.textColor = UIColor(hexString: "#333333")
        nameLabel.textAlignment = .center
        return nameLabel
    }()
    
    override func initUI() {
       
        contentView.addSubview(icon)
        icon.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.centerX.equalTo(contentView)
            make.width.height.equalTo(44)
        }
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(2)
            make.right.equalTo(-2)
            make.centerX.equalTo(contentView)
            make.top.equalTo(icon.snp.bottom).offset(6)
        }
    }
}
