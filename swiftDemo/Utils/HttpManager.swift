//
//  HttpManager.swift
//  swiftDemo
//
//  Created by weather on 2023/7/6.
//

import Foundation
import Alamofire
import KeychainAccess
import AdSupport
import AppTrackingTransparency

typealias NetworkRequestResult = Result<Data,Error>
typealias NetworkRequestCompletion = (NetworkRequestResult) -> Void

class HttpManager {
    static let shared = HttpManager()
    var sessionManager: Alamofire.Session!

    private init() {
        let config = URLSessionConfiguration.af.default
        config.timeoutIntervalForRequest = 15  // Timeout interval
        config.timeoutIntervalForResource = 15  // Timeout interval
        let serverTrustManager = ServerTrustManager(evaluators: [
            "api.qianyan.chat": DisabledTrustEvaluator(),
        ])
        sessionManager = Alamofire.Session(configuration: config, serverTrustManager: serverTrustManager)
    }
    
    @discardableResult func post(path: String, method: HTTPMethod = .post, parameters: Parameters?, headers: HTTPHeaders, completed: @escaping NetworkRequestCompletion) -> DataRequest {
        LogInfo("-----------------POST REQUEST BEGIN-----------------")
        LogInfo("path: \(path)")
        LogInfo("method: \(method.rawValue)")
        LogInfo("parameters: \(getParameters(parameters: parameters))")
        LogInfo("headers: \(headers)")
        
        return sessionManager.request(path, method: method, parameters: getParameters(parameters: parameters), encoding: JSONEncoding(), headers: headers).responseData { response in
            switch response.result {
            case .success(let data):
                completed(.success(data))
            case .failure(let error):
                completed(.failure(error))
            }
            LogInfo("-----------------POST REQUEST END-----------------")
        }
    }
    
    @discardableResult func v1_post(path: String, method: HTTPMethod = .post, parameters: Parameters?, completed: @escaping NetworkRequestCompletion) -> DataRequest {
        LogInfo("-----------------V1 POST REQUEST BEGIN-----------------")
        LogInfo("path: \(path)")
        LogInfo("method: \(method.rawValue)")
        LogInfo("parameters: \(String(describing: parameters))")
        LogInfo("headers: \(getV1Header())")
        
        return sessionManager.request(path, method: method, parameters: parameters, encoding: JSONEncoding(), headers: getV1Header()).responseData { response in
            switch response.result {
            case .success(let data):
                completed(.success(data))
            case .failure(let error):
                completed(.failure(error))
            }
            LogInfo("-----------------V1 POST REQUEST END-----------------")
        }
    }
    
    func getParameters(parameters: Parameters?) -> Parameters {
        let ts = Date().timeStamp;
        let secret = "\(APPID)\(ts)"
        let keyChain = Keychain(service: "com.qianyan.uuid.keychain")
        var uuid = try? keyChain.get("uuid")
        if (uuid == nil) {
            uuid = UUID().uuidString
            try? keyChain.set(uuid!, key: "uuid")
        }
        var deviceDict = ["deviceId": uuid ?? "", "channel": channelId, "platform": "ios", "osVersion": UIDevice.kOSVersion, "width": "\(UIDevice.kScreenWidth)", "height": "\(UIDevice.kScreenHeight)", "versionName": UIDevice.kVersionName, "versionCode": UIDevice.kBuild, "hstype": UIDevice.kModelName] as [String : Any]
        getIDFA { idfa in
            deviceDict["idfa"] = idfa
        }
        var dataDict = ["appid": APPID, "ts": ts, "secret": secret.hmacSha256, "device": deviceDict] as [String : Any]
        if parameters != nil {
            dataDict["params"] = parameters!
        }
        return dataDict
    }
    
    func getIDFA(completion: @escaping (_ idfa: String) -> Void) {
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                if status == .authorized {
                    completion(ASIdentifierManager.shared().advertisingIdentifier.uuidString)
                }
                return completion("000000000000-00000000000-0000")
            }
        } else {
            if ASIdentifierManager.shared().isAdvertisingTrackingEnabled {
                return completion(ASIdentifierManager.shared().advertisingIdentifier.uuidString)
            }
            return completion("000000000000-00000000000-0000")
        }
    }
    
    func getV1Header() -> HTTPHeaders {
        var headers: [String : String] = [:]
        if UserManager.shared.loginSign != nil {
            headers["loginSign"] = UserManager.shared.loginSign
        }
        headers["Host"] = "rnapi.qianyanapp.com"
        headers["authFlag"] = "v1"
        headers["Content-Type"] = "application/json"
        headers["userAgent"] = "zy"
        headers["Accept"] = "application/json"
        headers["Authorization"] = getAuthorization()
        return HTTPHeaders(headers)
    }
    
    func getAuthorization() -> String {
        let hsman = "iPhone"
        let hstype = UIDevice.kOSVersion
        let imsi = UIDevice.imsi
        let imei = "null"
        let ip = "0.0.0.0"
        let lac = "17695"
        let mac = "02:00:00:00:00:00"
        let pname = "com.zhy.qianyan-v\(UIDevice.kVersionName)-\(UIDevice.kBuild)"
        let width = Int(UIDevice.kScreenWidth * UIDevice.kScale)
        let height = Int(UIDevice.kScreenHeight * UIDevice.kScale)
        let authorization = "/\(hsman)/iOS\(hstype)/\(imsi)/\(imei)/\(ip)/\(lac)/\(mac)/\(pname)/\(width)/\(height)/\(UserManager.shared.userId ?? 0)"
        let encodedString = authorization.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: "?!@#$^&%*+,:;='\"`<>()[]{}/\\| ").inverted)
        var base64Auth = encodedString?.data(using: .utf8)?.base64EncodedString()
        base64Auth = base64Auth?.replacingOccurrences(of: "+", with: "-")
        base64Auth = base64Auth?.replacingOccurrences(of: "/", with: "-")
        let hmacSha1 = base64Auth?.hmacSha1
        let authorizationstr = "param=\(authorization)/\(hmacSha1!)"
        return authorizationstr
    }
    
}
