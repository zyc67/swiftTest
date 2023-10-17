//
//  HomeDiaryCell.swift
//  swiftDemo
//
//  Created by weather on 2023/8/14.
//

import UIKit
import Kingfisher
import SnapKit

class HomeDiaryCell: BaseTableViewCell {
    var bannerHeightConstraint: Constraint? = nil
    
    var model: DiaryModel? {
        didSet {
            avatar.kf.setImage(with: URL(string: model?.user.avtar ?? ""))
            nameLabel.text = model?.user.nickname
            diaryContentView.diary = model
            
            if model?.imgs?.count ?? 0 > 0 {
                bannerView.dataSource = model?.imgs
                bannerView.isHidden = false
                bannerHeightConstraint?.update(offset: 220)
                
            } else {
                bannerView.isHidden = true
                bannerHeightConstraint?.update(offset: 0)
            }
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
    
    lazy var diaryContentView: DiaryContentView = {
        let diaryContentView = DiaryContentView()
        return diaryContentView
    }()
    
    lazy var bannerView: BannerView = {
        let bannerView = BannerView()
        return bannerView
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
        
        contentView.addSubview(diaryContentView)
        diaryContentView.snp.makeConstraints { make in
            make.left.equalTo(avatar)
            make.right.equalTo(nameLabel)
            make.top.equalTo(avatar.snp.bottom).offset(10)
        }
        
        contentView.addSubview(bannerView)
        bannerView.snp.makeConstraints { make in
            make.left.equalTo(avatar)
            make.right.equalTo(nameLabel)
            make.top.equalTo(diaryContentView.snp.bottom).offset(10)
            bannerHeightConstraint = make.height.equalTo(220).priority(999).constraint
            make.bottom.equalTo(contentView.snp.bottom).offset(-16)
        }
        bannerView.tapClick = { imageModel, index in
            print(imageModel.imgUrl!, index)
        }
    }

}
