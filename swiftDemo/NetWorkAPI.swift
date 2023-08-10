//
//  NetWorkAPI.swift
//  swiftDemo
//
//  Created by weather on 2023/7/6.
//

import Foundation
import Alamofire

protocol URLConfig {
    func getPath() -> String
}

enum Interface: String, URLConfig {
    case accountLoginInterface = "/v2/qianyan/login/accountlogin"
    case phoneLoginInterface = "/v2/qianyan/login/phonelogin"
    case startupInterface = "/api/startup"
    case updateVersionInterface = "/api/updateselfNew";
    case v2SmsGetverifyCodeInterface = "/v2/common/sms/getverifycode";
    
    func getPath() -> String {
        return "\(baseURL)\(self.rawValue)"
    }
}

class NetWorkAPI {
    /// loginType  登录类型 1-手机密码登录（默认），2-手机验证码登录 ，3-是多个用户绑定了同一个手机号码，4是第三方账号登录 未绑定手机号码）
    /// account  用户名
    /// password  密码
    /// msgCode  短信验证码验证码 type=1时非必填type=2短信验证码
    /// isTeenagerMode 0 正常模式登录 1 青少年模式登录
    static func accountLogin(loginType: Int, account: String, password: String, msgCode: String, isTeenagerMode: Int, success: @escaping ([String: Any]) -> Void, failure: @escaping (Error) -> Void) {
        var parameters = ["account": account, "passwords": password]
        var url = Interface.accountLoginInterface.getPath()
        if loginType >= 2 {
            url = Interface.phoneLoginInterface.getPath()
            parameters = ["phone": account, "code": msgCode]
            if password.count > 0 {
                parameters["second_token"] = password
            }
        }
        if isTeenagerMode > 0 {
            parameters["isTeenagerMode"] = "\(isTeenagerMode)"
        }
        HttpManager.shared.post(path: url, parameters: parameters, headers: getHeaders(host: "login.qianyanapp.com", authFlag: "v2", loginSign: nil, authorization: nil)) { response in
            switch response {
            case .success(let data):
                success(data.dataToDictionary!)
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    /*
     接口地址：https://api.qianyan.chat:8443/v2/qianyan/login/accountlogin
     接口入参：{
     "secret":"bab8ac4fde94344b66cdd082b6ba96b255ebce23201e2692de79762fe43f9257",
     "ts":1688961506371,
     "appid":"qianyan",
     "device":{
        "deviceId":"EB512C57-12E5-4218-8FA2-7A2DE9C68CE3",
        "channel":"qianyan01",
        "height":"932",
        "versionName":"9.2.2",
        "osVersion":"16",
        "width":"430",
        "platform":"ios",
        "versionCode":"922",
        "hstype":"x86_64",
        "idfa":"000000000000-00000000000-0000"
     },
     "params":{
        "account":"13122897525",
        "passwords":"nTbHstao7lCtM80Ro8AeBfUL9bjUK71owZtoB7XjLfcLVp71NV+cuhFY8BQYNCajwLPIQCy6nP5pHi9uad26khF4bfPkCNfhZxtFpqiYbu3GGSJJ0rf4sz3gc7wM17lg1al+Ugp8nNOM5dKBwRtLl5bAucrvoITWnwTCl8DW\/e0="
        }
     }
     
     Host = "login.qianyanapp.com";
     authFlag = v2;
     
     path: https://api.qianyan.chat:8443/v2/qianyan/login/accountlogin
     method: HTTPMethod(rawValue: "POST")
     parameters: Optional([
        "secret": "4ce316132c007ab6e04052015a3224955d547d6ff3e83495116c65dfb54fcf1d",
        "ts": "1688961588749",
         "appid": "qianyan",
         "device": [
            "deviceId": "2417D39F-A649-4835-8AFF-2FA6D5F9076E",
            "channel": "qianyan01",
            "height": 932.0,
            "versionName": "9.2.2",
            "osVersion": "16",
            "width": 430.0,
            "platform": "ios",
            "versionCode": "922",
            "hstype": "x86_64",
            "idfa": "000000000000-00000000000-0000"],
            "params": [
                "account": "13122897525",
                "passwords": "aS1F0aVbNABA6IuZ0uJHHmogxX9jDG68j0K0u9zdJBxWD7V9GWpkWR440qTwXlrsmx1Bq98BWciwLHvoUOoLIj/5HzTmNCJhAq1KpdY7rR84VuYd+W9dfqW+lNB3rQIDfAg6enTy8ZzzEH7E2X54KVoQoclhXJHy8GuqaYd6KH8="
            ]
     ])
     headers: Host: login.qianyanapp.com
     authFlag: v2
     */
    
    
    /// 获取短信验证码
    /// - Parameters:
    ///   - phone: 手机号
    ///   - msgCodeType:
    ///   1-登录验证码，
    ///   2-绑定手机验证码
    ///   3-账号注销验证码
    ///   5-找回密码
    ///   6-青少年模式找回密码
    ///   5001-速记版-登录验证码，
    ///   5002-速记版-绑定手机验证码
    ///   5003-速记版-忘记密码验证码码
    ///   5003-速记版-注销验证码
    static func getVerifyCode(phone: String, msgCodeType: Int) {
        let parameters = ["phone": phone, "msgCodeType": msgCodeType] as [String : Any]
        if msgCodeType == 6 {
            // 需要传loginSign在这里添加
        }
        HttpManager.shared.post(path: Interface.v2SmsGetverifyCodeInterface.getPath(), parameters: parameters, headers: getHeaders(host: "sms.qianyanapp.com", authFlag: "v2", loginSign: nil, authorization: nil)) { response in
            switch response {
            case .success(let data):
                print(data.dataToDictionary as Any)
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension NetWorkAPI {
    static func getHeaders(host: String?, authFlag: String?, loginSign: String?, authorization: String?) -> HTTPHeaders {
        var headers: [String : String] = [:]
        if host != nil {
            headers["Host"] = host
        }
        if authFlag != nil {
            headers["authFlag"] = authFlag
        }
        if loginSign != nil {
            headers["loginSign"] = loginSign
        }
        if authorization != nil {
            headers["Authorization"] = authorization
        }
        return HTTPHeaders(headers)
    }
}
