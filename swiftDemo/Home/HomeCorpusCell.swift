//
//  HomeCorpusCell.swift
//  swiftDemo
//
//  Created by weather on 2023/9/13.
//

import UIKit

class HomeCorpusCell: BaseCollectionViewCell {
    var model: CorpusModel? {
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
        nameLabel.textColor = UIColor(hexString: "#B89AFF")
        nameLabel.textAlignment = .center
        return nameLabel
    }()
    
    override func initUI() {
        contentView.backgroundColor = UIColor.randomColor()
        contentView.addSubview(icon)
        icon.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(contentView)
            make.width.equalTo(118)
            make.height.equalTo(168)
        }
        
        icon.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(2)
            make.right.equalTo(-2)
            make.centerX.equalTo(icon)
            make.bottom.equalTo(icon.snp.bottom).offset(-6)
        }
    }
}
