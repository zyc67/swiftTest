//
//  HomeHandCell.swift
//  swiftDemo
//
//  Created by weather on 2023/8/26.
//

import UIKit

class HomeHandCell: BaseTableViewCell {
    
    var model: HandModel? {
        didSet {
            avatar.kf.setImage(with: URL(string: model?.user.avtar ?? ""))
            nameLabel.text = model?.user.nickname
            contentLabel.text = model?.name
            icon.kf.setImage(with: URL(string: model?.shotcuts ?? ""))
        }
    }

    lazy var avatar: UIImageView = {
        let avatar = UIImageView()
        avatar.contentMode = .scaleAspectFit
        avatar.layer.cornerRadius = 20
        avatar.layer.borderColor = UIColor.systemPink.cgColor
        avatar.layer.borderWidth = 2
        avatar.layer.masksToBounds = true
        return avatar
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 18)
        nameLabel.textColor = UIColor(hexString: "#333333")
        return nameLabel
    }()
    
    lazy var contentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.font = UIFont.systemFont(ofSize: 16)
        contentLabel.textColor = UIColor(hexString: "#333333")
        contentLabel.numberOfLines = 0
        return contentLabel
    }()
    
    lazy var icon: UIImageView = {
        let icon = UIImageView()
        icon.layer.cornerRadius = 10
        icon.layer.masksToBounds = true
        icon.contentMode = .scaleAspectFill
        return icon
    }()
    
    
    override func initUI() {
        backgroundColor = .white
        
        contentView.addSubview(avatar)
        avatar.snp.makeConstraints { make in
            make.left.top.equalTo(contentView).offset(16)
            make.width.height.equalTo(40)
        }
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(avatar.snp.right).offset(10)
            make.right.equalTo(contentView.snp.right).offset(-16)
            make.centerY.equalTo(avatar.snp.centerY)
        }
        
        contentView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { make in
            make.left.equalTo(avatar)
            make.right.equalTo(nameLabel)
            make.top.equalTo(avatar.snp.bottom).offset(10)
        }
        
        contentView.addSubview(icon)
        icon.snp.makeConstraints { make in
            make.left.equalTo(avatar)
            make.width.equalTo(280)
            make.height.equalTo(400)
            make.top.equalTo(contentLabel.snp.bottom).offset(10)
            make.bottom.equalTo(contentView.snp.bottom).offset(-16)
        }
    }

}
