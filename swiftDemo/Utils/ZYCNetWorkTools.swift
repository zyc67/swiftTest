//
//  ZYCNetWorkTools.swift
//  swiftDemo
//
//  Created by weather on 2023/6/16.
//

import Foundation
import Alamofire
import KeychainAccess
import AdSupport
import AppTrackingTransparency

//protocol URLConfig {
//    func getPath() -> String
//    func getHeadersV1() -> HTTPHeaders
//    func getHeaders() -> HTTPHeaders
//}
//
//enum Interface: String, URLConfig {
////    case vipExtraInfo = "/member/memberinfo/extras"
//    case accountLoginInterface = "/v2/qianyan/login/accountlogin"
//    case phoneLoginInterface = "/v2/qianyan/login/phonelogin"
//    case startupInterface = "/api/startup"
//    case updateVersionInterface = "/api/updateselfNew";
//    
//    func getPath() -> String {
//        return "\(baseURL)\(self.rawValue)"
//    }
//    
//    func getHeaders() -> HTTPHeaders {
//        switch self {
//        case .accountLoginInterface:
//            return ["Host": "login.qianyanapp.com", "authFlag": "v2"]
//        default:
//            return [:]
//        }
//    }
//    
//    func getHeadersV1() -> HTTPHeaders {
//        return ["Host": "rnapi.qianyanapp.com", "authFlag": "v1", "Content-Type": "application/json", "Accept": "application/json", "userAgent": "zy", "Authorization": "param=/iPhone/iOS16.4/460022402238613/null/192.168.140.137/17695/02:00:00:00:00:00/com.zhy.qianyan-v9.2.0-920/1290/2796/0/faf5bcd5d68431ed13eb891ffa73f90b015e5ae3"]
//    }
//}
//
//enum NetHttpMethod: String {
//    case GET
//    case POST
//    case PUT
//    case DELETE
//}
//
//enum RequestType {
//    case normal
//    
//    fileprivate func getRequestType(_ requestData: Dictionary<String, Any>?) throws -> Dictionary<String, Any> {
//        switch self {
//        case .normal:
//            return getRequestParmas(requestData)
//        }
//    }
//    
//    func getRequestParmas(_ requestData: Dictionary<String, Any>?) -> Dictionary<String, Any> {
//        let ts = Date().timeStamp;
//        let secret = "\(APPID)\(ts)"
//        let keyChain = Keychain(service: "com.qianyan.uuid.keychain")
//        var uuid = try? keyChain.get("uuid")
//        if (uuid == nil) {
//            uuid = UUID().uuidString
//            try? keyChain.set(uuid!, key: "uuid")
//        }
//        var deviceDict = ["deviceId": uuid ?? "", "channel": channelId, "platform": "ios", "osVersion": UIDevice.kOSVersion, "width": UIDevice.kScreenWidth, "height": UIDevice.kScreenHeight, "versionName": UIDevice.kVersionName, "versionCode": UIDevice.kBuild, "hstype": UIDevice.kModelName] as [String : Any]
//        getIDFA { idfa in
//            deviceDict["idfa"] = idfa
//        }
//        var dataDict = ["appid": APPID, "ts": ts, "secret": secret.hmacSha256, "device": deviceDict] as [String : Any]
//        if requestData?.count ?? 0 > 0 {
//            dataDict["params"] = requestData!
//        }
////        let dataDict = ["appid": "qianyan", "secret": "3fb6395b4a79d7539e724930df68f1d859aee6a95a49b54c29ae201d7e5c4239", "ts": "1688450636222", "params": ["account": "13122897525", "passwords":"b7zonXTPZ5/XPCZqHsjIiP8bP1xiQ4G7JV+fIfvDAV2NfUzUFVzSbuJ5wn9FWWwJcOcUUB7BnXkgjUV7nf7c/5ANHwhC9n9GtOTOEhSb5SXkXNtYjfTUeDN6LGP6zbxcoMmWOVD3ePY2S89Pf2Yn7vSYuAIuUWdjSi2GLOmGEfg="], "device": ["channel": "qianyan01", "deviceId": "EB512C57-12E5-4218-8FA2-7A2DE9C68CE3", "height": "932", "hstype": "x86_64", "idfa": "000000000000-00000000000-0000", "osVersion": "16", "platform": "ios", "versionCode": "924", "versionName": "9.2.4", "width": "430"]] as [String : Any]
//
//        return dataDict
//    }
//    
//    func getIDFA(completion: @escaping (_ idfa: String) -> Void) {
//        if #available(iOS 14, *) {
//            ATTrackingManager.requestTrackingAuthorization { status in
//                if status == .authorized {
//                    completion(ASIdentifierManager.shared().advertisingIdentifier.uuidString)
//                }
//                return completion("000000000000-00000000000-0000")
//            }
//        } else {
//            if ASIdentifierManager.shared().isAdvertisingTrackingEnabled {
//                return completion(ASIdentifierManager.shared().advertisingIdentifier.uuidString)
//            }
//            return completion("000000000000-00000000000-0000")
//        }
//    }
//}
//
//enum DataResult<T> {
//    case success(T)
//    case failure(NSError)
//}
//
//extension DataResult {
//    public var isSuccess: Bool {
//        switch self {
//        case .success:
//            return true
//        case .failure:
//            return false
//        }
//    }
//    
//    public var isFailure: Bool {
//        return !isSuccess
//    }
//    
//    public var value: T? {
//        switch self {
//        case .success(let value):
//            return value
//        case .failure:
//            return nil
//        }
//    }
//    
//    public var error: NSError? {
//        switch self {
//        case .success:
//            return nil
//        case .failure(let error):
//            return error
//        }
//    }
//}
//
//protocol RequestManagerProtocol {
//    func managerRequest(withInterface: String, parameters:[String : Any]?, method: NetHttpMethod, headers: HTTPHeaders, callBack: @escaping(_ dataResult: DataResult<Data>) -> Void) -> URLSessionTask?
//}
//
//final class RequestManager: RequestManagerProtocol {
//    @discardableResult func managerRequest(withInterface interface: String, parameters: [String : Any]?, method: NetHttpMethod, headers: HTTPHeaders, callBack: @escaping (DataResult<Data>) -> Void) -> URLSessionTask? {
//        var dataRequest: Alamofire.DataRequest?
//        dataRequest = AF.request(interface, method: HTTPMethod(rawValue: method.rawValue), parameters: parameters, headers: headers).responseData(completionHandler: { dataResponse in
//            switch dataResponse.result {
//            case .success(let data):
//                callBack(DataResult.success(data))
//            case .failure(let error):
//                callBack(DataResult.failure(error as NSError))
//            }
//        })
//        return dataRequest?.task
//    }
//}
//
//public class NetWorkTools {
//    
//    private static let manager: RequestManagerProtocol = RequestManager()
//    
//    @discardableResult class func request(withInterface interface: URLConfig, requestData: [String : Any]?, method : NetHttpMethod = .POST, serverType : RequestType = RequestType.normal, completed: @escaping(_ dataResult : DataResult<Dictionary<String, Any>>) -> Void) -> URLSessionTask? {
//        do {
//            print("-----------------request begin-----------------")
//            print("Interface:\(interface.getPath())")
//            print("RequestType:\(method.rawValue)")
//            let realRequestData = try serverType.getRequestType(requestData)
//            print("Params:\(realRequestData)")
//            print("headers:\(interface.getHeaders())")
//            let task = self.manager.managerRequest(withInterface: interface.getPath(), parameters: realRequestData, method: method, headers: interface.getHeaders()) { dataResult in
//                switch dataResult {
//                case .success(let value):
//                    completed(DataResult.success(value.dataToDictionary ?? [:]))
//                default:
//                    print("error")
//                }
//                print("-----------------request end-----------------")
//            }
//            return task
//            
//            
//            
//        } catch {
//            completed(DataResult.failure(error as NSError))
//            return nil
//        }
//    }
//    
//    @discardableResult class func getRequest(withInterface interface: URLConfig, parameters: [String: Any]?, method : NetHttpMethod = .GET, completed: @escaping(_ dataResult : DataResult<Dictionary<String, Any>>) -> Void) -> URLSessionTask? {
//        print("-----------------GET REQUEST BEGIN-----------------")
//        print("Interface:\(interface.getPath())")
//        print("Parameters:\(String(describing: parameters))")
//        print("headers:\(interface.getHeadersV1())")
//        let task = self.manager.managerRequest(withInterface: interface.getPath(), parameters: parameters, method: method, headers: interface.getHeadersV1()) { dataResult in
//            switch dataResult {
//            case .success(let value):
//                completed(DataResult.success(value.dataToDictionary ?? [:]))
//            case .failure(let error):
//                completed(DataResult.failure(error as NSError))
//            }
//            print("-----------------GET REQUEST END-----------------")
//        }
//        return task
//    }
//}

















//public final class ZYCNetWorkTools {
////    static let shared = ZYCNetWorkTools()
//
////    lazy var sessionManager: SessionManager = {
////        let config = URLSessionConfiguration.default
////        config.timeoutIntervalForRequest = 30
////        let manager = Alamofire.SessionManager(configuration: config)
////        return manager
////    }()
//}
//
//extension ZYCNetWorkTools {
//    public func getWithUrl(url: String) {
////        AF.request(url).response { response in
////
////        }
//        let headers: HTTPHeaders = [
////            .accept("application/json")
////            .authorization("Basic VXNlcm5hbWU6UGFzc3dvcmQ=")
//            "Authorization": "Basic VXNlcm5hbWU6UGFzc3dvcmQ=",
//            "Accept": "application/json"
//        ]
//        AF.request(url, method: .get, headers: headers, requestModifier: { urlRequest in
//            urlRequest.timeoutInterval = 20
////            urlRequest.method = .get
//        })
//        .validate(statusCode: 200..<300)
//        .response { response in
//
//        }
//    }
//
//    static public func v2_postWithUrl(url: String, headers: HTTPHeaders, params: Encodable) {
//        AF.request(url, method: .post, parameters: params, encoder: JSONParameterEncoder.default, headers: headers).response { response in
//            print(response)
//        }
//    }
//
//}
//
//extension ZYCNetWorkTools {
//    static public func login(type: NSInteger, account: String, password: String, msgCode: String, isTeenagerMode: NSInteger) {
////        struct LoginData: Encodable {
////            let account: String
////            let passwords: String
////            let msgCode: String
////            let isTeenagerMode: Bool
////        }
//        let apiHeader: HTTPHeaders = [
//            "Host": "login.qianyanapp.com",
//            "authFlag": "v2"
//        ]
////        var params = LoginData(account: account, passwords: password)
//
//        var url = accountLoginInterface
//
//        var params = ["account": account, "passwords": password]
//
//        if type >= 2 {
//            url = phoneLoginInterface
//            params = ["phone": account, "code": msgCode]
//
//            if password.count > 0 {
//                params["second_token"] = password
////                params = ["phone": account, "code": msgCode, "second_token": password]
//            }
//        }
//
//        if isTeenagerMode > 0 {
//            // MARK: value ? string
//            params["isTeenagerMode"] = "\(isTeenagerMode)"
//        }
//
//        v2_postWithUrl(url: "\(baseURL)\(url)", headers: apiHeader, params: params)
//    }
//}
