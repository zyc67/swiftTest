//
//  HomeTopicCell.swift
//  swiftDemo
//
//  Created by weather on 2023/8/30.
//

import UIKit

class HomeTopicCell: BaseCollectionViewCell {
    
    var model: TopicModel? {
        didSet {
            icon.kf.setImage(with: URL(string: model?.iconUrl ?? ""))
            nameLabel.text = model?.name
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
        return nameLabel
    }()
    
    override func initUI() {
        contentView.backgroundColor = .red
        contentView.addSubview(icon)
        icon.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.centerY.equalTo(contentView)
            make.width.height.equalTo(44)
        }
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(icon.snp.right).offset(10)
            make.right.lessThanOrEqualTo(-16)
            make.centerY.equalTo(contentView)
        }
    }
}
