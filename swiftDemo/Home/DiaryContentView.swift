//
//  DiaryContentView.swift
//  swiftDemo
//
//  Created by weather on 2023/8/23.
//

import UIKit
//import ActiveLabel

class DiaryContentView: UIView {
    
    var diary: DiaryModel? {
        didSet {
            if diary?.translate == 1, diary?.translateJson.count ?? 0 > 0 {
                contentLabel.isHidden = true
                contentOneLabel.isHidden = false
                contentOneTransLabel.isHidden = false
                contentTwoLabel.isHidden = false
                contentTwoTransLabel.isHidden = false
                
//                print("------------------------------------")
//                print(diary?.translateJson.stringToJson as? [[String: Any]])

                drawContent(label: contentOneLabel, analyzeContent: diary!.translateSrcOne!.analyzeContent())
                drawContent(label: contentOneTransLabel, analyzeContent: diary!.translateDstOne!.analyzeContent())
                
                if diary?.translateSrcTwo?.count ?? 0 > 1 {
                    drawContent(label: contentTwoLabel, analyzeContent: diary!.translateSrcTwo!.analyzeContent())
                    drawContent(label: contentTwoTransLabel, analyzeContent: diary!.translateDstTwo!.analyzeContent())

//                    contentLabel.snp.remakeConstraints { make in
//                        make.left.right.top.equalTo(self)
//                    }
//                    contentOneTransLabel.snp.remakeConstraints { make in
//                        make.left.right.equalTo(self)
//                        make.top.equalTo(contentOneLabel.snp.bottom).offset(6)
//                    }
                    
                    contentTwoTransLabel.snp.remakeConstraints { make in
                        make.left.right.equalTo(self)
                        make.top.equalTo(contentTwoLabel.snp.bottom).offset(6)
                        make.bottom.equalTo(self)
                    }
                } else {
                    contentTwoLabel.isHidden = true
                    contentTwoTransLabel.isHidden = true
                    
//                    contentLabel.snp.remakeConstraints { make in
//                        make.left.right.top.equalTo(self)
//                    }
                    contentOneTransLabel.snp.remakeConstraints { make in
                        make.left.right.equalTo(self)
                        make.top.equalTo(contentOneLabel.snp.bottom).offset(6)
                        make.bottom.equalTo(self)
                    }
//                    contentTwoTransLabel.snp.remakeConstraints { make in
//                        make.left.right.equalTo(self)
//                        make.top.equalTo(contentTwoLabel.snp.bottom).offset(6)
//                    }
                }
            } else {
                contentLabel.isHidden = false
                contentOneLabel.isHidden = true
                contentOneTransLabel.isHidden = true
                contentTwoLabel.isHidden = true
                contentTwoTransLabel.isHidden = true
                guard let analyzeContent = diary?.analyzeContent else { return }
                drawContent(label: contentLabel, analyzeContent: analyzeContent)
                
                contentLabel.snp.remakeConstraints { make in
                    make.left.right.top.equalTo(self)
                    make.bottom.equalTo(self)
                }
//                contentOneTransLabel.snp.remakeConstraints { make in
//                    make.left.right.equalTo(self)
//                    make.top.equalTo(contentOneLabel.snp.bottom).offset(6)
//                }
//                contentTwoTransLabel.snp.remakeConstraints { make in
//                    make.left.right.equalTo(self)
//                    make.top.equalTo(contentTwoLabel.snp.bottom).offset(6)
//                }
            }
        }
    }
    
    lazy var contentLabel: UILabel! = {
        let contentLabel = UILabel()
//        contentLabel.enabledTypes = [.custom(pattern: ".*")]
        contentLabel.isHidden = true
        contentLabel.textColor = UIColor(hexString: "#333333")
        contentLabel.font = UIFont.systemFont(ofSize: 15)
        contentLabel.numberOfLines = 5
        return contentLabel
    }()
    
    lazy var contentOneLabel: UILabel! = {
        let contentLabel = UILabel()
        contentLabel.isHidden = true
        contentLabel.textColor = UIColor(hexString: "#333333")
        contentLabel.font = UIFont.systemFont(ofSize: 15)
        contentLabel.numberOfLines = 2
        return contentLabel
    }()
    
    lazy var contentOneTransLabel: UILabel! = {
        let contentLabel = UILabel()
        contentLabel.isHidden = true
        contentLabel.textColor = UIColor(hexString: "#A7A7A7")
        contentLabel.font = UIFont.systemFont(ofSize: 13)
        contentLabel.numberOfLines = 2
        return contentLabel
    }()
    
    lazy var contentTwoLabel: UILabel! = {
        let contentLabel = UILabel()
        contentLabel.isHidden = true
        contentLabel.textColor = UIColor(hexString: "#333333")
        contentLabel.font = UIFont.systemFont(ofSize: 15)
        contentLabel.numberOfLines = 2
        return contentLabel
    }()
    
    lazy var contentTwoTransLabel: UILabel! = {
        let contentLabel = UILabel()
        contentLabel.isHidden = true
        contentLabel.textColor = UIColor(hexString: "#A7A7A7")
        contentLabel.font = UIFont.systemFont(ofSize: 13)
        contentLabel.numberOfLines = 2
        return contentLabel
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI() {
        self.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { make in
            make.left.right.top.equalTo(self)
        }
        
        self.addSubview(contentOneLabel)
        contentOneLabel.snp.makeConstraints { make in
            make.left.right.top.equalTo(self)
        }
        
        // TODO: Height is ambiguous for UILabel
        
        self.addSubview(contentOneTransLabel)
        contentOneTransLabel.snp.makeConstraints { make in
            make.left.right.equalTo(self)
            make.top.equalTo(contentOneLabel.snp.bottom).offset(6)
        }
        
        self.addSubview(contentTwoLabel)
        contentTwoLabel.snp.makeConstraints { make in
            make.left.right.equalTo(self)
            make.top.equalTo(contentOneTransLabel.snp.bottom).offset(10)
        }
        
        self.addSubview(contentTwoTransLabel)
        contentTwoTransLabel.snp.makeConstraints { make in
            make.left.right.equalTo(self)
            make.top.equalTo(contentTwoLabel.snp.bottom).offset(6)
        }
    }
}

extension DiaryContentView {
    func drawContent(label: UILabel, analyzeContent: (String, [[String: Any]]?, [[String: Any]]?)) {
        let (text, users, talks) = analyzeContent
        let attri = NSMutableAttributedString(string: text)
        if let users = users {
            for user in users {
                let userId: String = user["userId"] as! String
                let username: String = String(describing: user["username"])
                let scope: [Int] = user["scope"] as! [Int]
                attri.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(hexString: "#B89AFF")!, range: NSRange(location: scope.first!, length: scope.last!))
//                print(username, scope, attri)
            }
        }
        
        if let talks = talks {
            for talk in talks {
                let talkId: String = talk["talkId"] as! String
                let talkname: String = String(describing: talk["talkname"])
                let scope: [Int] = talk["scope"] as! [Int]
                attri.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(hexString: "#B89AFF")!, range: NSRange(location: scope.first!, length: scope.last!))
//                print(talkname, scope, attri)
            }
        }
        label.attributedText = attri
        label.set(lineSpacing: 4)
    }
}

//extension DiaryContentView: ActiveLabelDelegate {
////    func didSelect(_ text: String, type: ActiveType) {
////        ZYCLog("---")
////    }
//
//    func didSelect(_ index: Int) {
//        ZYCLog("---\(index)");
//    }
//}
