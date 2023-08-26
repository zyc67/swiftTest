//
//  StringUtils.swift
//  swiftDemo
//
//  Created by weather on 2023/6/30.
//

import Foundation
import CommonCrypto

extension String {
    var hmacSha256: String {
        let cKey = netWorkKey.data(using: .utf8)
        let cData = self.cString(using: .utf8)
        var result = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        CCHmac(CCHmacAlgorithm(kCCHmacAlgSHA256), cKey?.bytes, cKey?.count ?? 0, cData, strlen(cData!), &result);
        return result.reduce("") { $0 + String(format:"%02x", $1) }
    }
    
    var hmacSha1: String {
        let cKey = netWorkV1Key.data(using: .utf8)
        let cData = self.cString(using: .utf8)
        var result = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        CCHmac(CCHmacAlgorithm(kCCHmacAlgSHA1), cKey?.bytes, cKey?.count ?? 0, cData, strlen(cData!), &result);
        return result.reduce("") { $0 + String(format:"%02x", $1) }
    }
}

extension String {
    var bytes: [UInt8] {
        return [UInt8](self.utf8)
    }
}

extension String {
    var stringToJson: Any? {
        return self.data(using: .utf8)?.dataToJson as? Any
    }
}

extension String {
    // 0{at id=123,name=456}1{at id=123,name=456}2{at id=123,name=456}{at id=123,name=456}
    // 0       123      456}1       123      456}2       123      456}       123      456}
    func analyzeContent() -> (String, [[String: Any]]?, [[String: Any]]?) {
        var atStr: String = ""
        var content: String = ""
        var userList: [[String: Any]] = []
        var talkList: [[String: Any]] = []
        var preLength: Int = 0
        
        let atArray = self.components(separatedBy: "{at id=")
        for atString in atArray {
            if atString.contains(",name=") {
                let atArray2 = atString.components(separatedBy: ",name=")
                if atArray2.count > 1 {
                    let userId = atArray2.first
                    let nameString = atArray2.last
                    let index = nameString?.firstIndex(of: "}") ?? nameString?.startIndex
                    if let index = index {
                        let username = nameString?[..<index]
                        userList.append(["userId": userId!, "username": username!, "scope": [atStr.utf16.count, "@\(username!)".utf16.count]])
                        atStr += "@\(username!)"
                        preLength = atStr.utf16.count
                        if let endIndex = nameString?.endIndex {
                            let last = nameString?[(nameString?.index(index, offsetBy: 1) ?? endIndex)..<endIndex]
                            if last?.count ?? 0 > 0 {
                                atStr += last!
                                preLength = atStr.utf16.count
                            }
                        }
                    }
                } else {
                    atStr += atString
                    preLength = atStr.utf16.count
                }
            } else {
                atStr += atString
                preLength = atStr.utf16.count
            }
        }
        
        preLength = 0
        let talkArray = atStr.components(separatedBy: "{hashtag talkid=")
        for talkString in talkArray {
            if talkString.contains(",talkname=") {
                let talkArray2 = talkString.components(separatedBy: ",talkname=")
                if talkArray2.count > 1 {
                    let talkId = talkArray2.first
                    let nameString = talkArray2.last
                    let index = nameString?.firstIndex(of: "}") ?? nameString?.startIndex
                    if let index = index {
                        let talkname = nameString?[..<index]
                        talkList.append(["talkId": talkId!, "talkname": talkname!, "scope": [content.utf16.count, "@\(talkname!)".utf16.count]])
                        content += "@\(talkname!))"
                        preLength = content.utf16.count
                        if let endIndex = nameString?.endIndex {
                            let last = nameString?[(nameString?.index(index, offsetBy: 1) ?? endIndex)..<endIndex]
                            if last?.count ?? 0 > 0 {
                                atStr += last!
                                preLength = content.utf16.count
                            }
                        }
                    }
                } else {
                    content += talkString
                    preLength = content.utf16.count
                }
            } else {
                content += talkString
                preLength = content.utf16.count
            }
        }
        
        return (content, userList, talkList)
    }
}

