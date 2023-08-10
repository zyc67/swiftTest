//
//  ZYCHomeViewController.swift
//  swiftDemo
//
//  Created by weather on 2023/3/24.
//

import UIKit
import SwiftyRSA
import SwiftyJSON


class ZYCHomeViewController: UIViewController {
    
    override func viewDidLoad() {
        do {
            let clear = try ClearMessage(string: "654321", using: .utf8)
            let encrypted = try clear.encrypted(with: try PublicKey(base64Encoded: RSAPublickKey), padding: .PKCS1)
            let base64String = encrypted.base64String

            NetWorkAPI.accountLogin(loginType: 1, account: "13122897525", password: base64String, msgCode: "", isTeenagerMode: 0) { data in
                let json = JSON(data)
                let code = json["code"].intValue
                if (code == 1) {
                    let user = UserInfo(fromDictionary: json["data"]["data"].dictionaryObject ?? [:])
                }
            } failure: { error in
                
            }
        } catch {

        }
        
//        NetWorkTools.getRequest(withInterface: Interface.updateVersionInterface, parameters: ["osType": 1, "versionName": UIDevice.kVersionName, "versionCode": UIDevice.kBuild, "channel": channelId, "sdk_ver": 1]) { dataResult in
//            switch dataResult {
//            case .success(let value):
//                print(value)
//            case .failure(let error):
//                print(error)
//            }
//        }
      
//        NetWorkTools.request(withInterface: Interface.vipExtraInfo, requestData: ["user_id": "1908"], method: .GET) { dataResult in
//            switch dataResult {
//            case .success(let value):
//                let info = MemberInfoExtrasModel(JSON: value)
//                print(JSON(value))
//                print(info?.collect ?? 0)
//                print(info?.sms ?? 0)
//                print(info?.bean ?? 0)
//                print(info?.msg ?? "")
//                print(info?.code ?? 0)
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
}
