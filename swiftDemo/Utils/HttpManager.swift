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
        ZYCLog("-----------------POST REQUEST BEGIN-----------------")
        ZYCLog("path: \(path)")
        ZYCLog("method: \(method.rawValue)")
        ZYCLog("parameters: \(getParameters(parameters: parameters))")
        ZYCLog("headers: \(headers)")
        
        return sessionManager.request(path, method: method, parameters: getParameters(parameters: parameters), encoding: JSONEncoding(), headers: headers).responseData { response in
            switch response.result {
            case .success(let data):
                completed(.success(data))
            case .failure(let error):
                completed(.failure(error))
            }
            ZYCLog("-----------------POST REQUEST END-----------------")
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
}
