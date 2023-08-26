//
//  ZYCCommon.swift
//  swiftDemo
//
//  Created by weather on 2023/5/31.
//
import UIKit
import SnapKit
import CoreTelephony.CTTelephonyNetworkInfo
import CoreTelephony.CTCarrier

extension UIDevice {
    /// 安全区域
    static var safeAreaEdgeInsets: UIEdgeInsets {
        get {
            if #available(iOS 13.0, *) {
                let scene = UIApplication.shared.connectedScenes.first
                guard let windowScene = scene as? UIWindowScene else {
                    return UIEdgeInsets()
                }
                guard let window = windowScene.windows.first else {
                    return UIEdgeInsets()
                }
                return window.safeAreaInsets
            } else if #available(iOS 11.0, *) {
                guard let window = UIApplication.shared.windows.first else {
                    return UIEdgeInsets()
                }
                return window.safeAreaInsets
            }
            return UIEdgeInsets()
        }
    }
    
    /// 是否刘海屏
    static var isIphoneXMore: Bool {
        get {
            return safeAreaEdgeInsets.bottom > 0
        }
    }
    
    /// 顶部安全高度
    static var safeAreaTop: CGFloat {
        return safeAreaEdgeInsets.top
    }
    
    /// 底部安全高度
    static var safeAreaBottom: CGFloat {
        return safeAreaEdgeInsets.bottom
    }
    
    /// 状态栏高度
    static var statusBarHeight: CGFloat {
        var height: CGFloat = 0
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return 0 }
            guard let statusBarManager = windowScene.statusBarManager else { return 0 }
            height = statusBarManager.statusBarFrame.height
        } else {
            height = UIApplication.shared.statusBarFrame.height
        }
        return height
    }
    
    /// 导航栏高度
    static var navigationBarHeight: CGFloat {
        return 44.0
    }
    
    /// 导航栏 + 状态栏 高度
    static var navigationFullHeight: CGFloat {
        return statusBarHeight + navigationBarHeight
    }
    
    /// tabbar高度
    static var tabbarHeight: CGFloat {
        return 49.0
    }
    
    /// tabbar + 底部安全 高度
    static var tabbarFullHeight: CGFloat {
        return tabbarHeight + safeAreaBottom
    }
    
    static var kScreenWidth: CGFloat {
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else {
                return UIScreen.main.bounds.width;
            }
            return windowScene.screen.bounds.width
        }
        return UIScreen.main.bounds.width;
    }
    
    static var kScreenHeight: CGFloat {
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else {
                return UIScreen.main.bounds.height;
            }
            return windowScene.screen.bounds.height
        }
        return UIScreen.main.bounds.height;
    }
    
    static var kScale: CGFloat {
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else {
                return UIScreen.main.scale;
            }
            return windowScene.screen.scale
        }
        return UIScreen.main.scale;
    }
    
    static var kOSVersion: String {
        return self.current.systemVersion.components(separatedBy: ".")[0]
    }
    
    static var kVersionName: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }
    
    static var kBuild: String {
        var build = Bundle.main.infoDictionary?["CFBundleVersion"] as! String
        if  build.count >= 3 {
            build = String(build[build.startIndex..<build.index(build.startIndex, offsetBy: 3)])
        }
        return build
    }
    
    static var kModelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else {
                return identifier
            }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        switch identifier {
        case "iPhone5,1", "iPhone5,2": return "iPhone5"
        case "iPhone5,3", "iPhone5,4": return "iPhone5C"
        case "iPhone6,1", "iPhone6,2": return "iPhone5S"
        case "iPhone7.2": return "iPhone6"
        case "iPhone7,1": return "iPhone6Plus"
        case "iPhone8,1": return "iPhone6s"
        case "iPhone8,2": return "iPhone6Plus"
        case "iPhone8,4": return "iPhoneSE1"
        case "iPhone9,1","iPhone9,3": return "iPhone7"
        case "iPhone9,2","iPhone9,4": return "iPhone7Plus"
        case "iPhone10,1","iPhone10,4": return "iPhone8"
        case "iPhone10,2","iPhone10,5": return "iPhone8Plus"
        case "iPhone10,3","iPhone10,6": return "iPhoneX"
        case "iPhone11,8": return "iPhoneXR"
        case "iPhone11,2": return "iPhoneXS"
        case "iPhone11,6", "iPhone11,4": return "iPhoneXSMax"
        case "iPhone12,1": return "iPhone11"
        case "iPhone12,3": return "iPhone11Pro"
        case "iPhone12,5": return "iPhone11ProMax"
        case "iPhone12,8": return "iPhoneSE2"
        case "iPhone13,1": return "iPhone12Mini"
        case "iPhone13,2": return "iPhone12"
        case "iPhone13,3": return "iPhone12Pro"
        case "iPhone13,4": return "iPhone12ProMax"
        case "iPhone14,4": return "iPhone13Mini"
        case "iPhone14,5": return "iPhone13"
        case "iPhone14,2": return "iPhone13Pro"
        case "iPhone14,3": return "iPhone13ProMax"
        case "iPhone14,7": return "iPhone14"
        case "iPhone14,8": return "iPhone14Plus"
        case "iPhone15,2": return "iPhone14Pro"
        case "iPhone15,3": return "iPhone14ProMax"
        // Simulator
        case "i386": return "i386"
        case "x86_64": return "x86_64"
        default: return "unknown"
        }
    }
    
    static var imsi: String {
        let info = CTTelephonyNetworkInfo()
        var mcc: String = ""
        var mnc: String = ""
        
        if #available(iOS 12.0, *) {
            if let cellularProviders = info.serviceSubscriberCellularProviders, cellularProviders.keys.first != nil {
                let carrier: CTCarrier? = info.value(forKey: cellularProviders.keys.first ?? "") as? CTCarrier
                mcc = carrier?.mobileCountryCode ?? ""
                mnc = carrier?.mobileNetworkCode ?? ""
            }
        } else {
            mcc = info.subscriberCellularProvider?.mobileCountryCode ?? ""
            mnc = info.subscriberCellularProvider?.mobileNetworkCode ?? ""
        }
        if mcc.isEmpty || mnc.isEmpty {
            return "460022402238613"
        }
        return mcc + mnc
    }
}

extension UIColor {
    private convenience init?(hex6: Int64, alpha: Float) {
        self.init(red: CGFloat( (hex6 & 0xFF0000) >> 16 ) / 255.0,
                  green: CGFloat( (hex6 & 0x00FF00) >> 8 ) / 255.0,
                  blue: CGFloat( (hex6 & 0x0000FF) >> 0 ) / 255.0, alpha: CGFloat(alpha))
    }

    private convenience init?(hex8: Int64, alpha: Float?) {
        self.init(red: CGFloat( (hex8 & 0xFF000000) >> 24 ) / 255.0,
                  green: CGFloat( (hex8 & 0x00FF0000) >> 16 ) / 255.0,
                  blue: CGFloat( (hex8 & 0x0000FF00) >> 8 ) / 255.0,
                  alpha: alpha.map(CGFloat.init(_:)) ?? CGFloat( (hex8 & 0x000000FF) >> 0 ) / 255.0)
    }
    
    convenience init?(hexString: String, alpha: Float? = nil) {
        var hex = hexString

        // Check for hash and remove the hash
        if hex.hasPrefix("#") {
            hex = String(hex[hex.index(after: hex.startIndex)...])
        }

        guard let hexVal = Int64(hex, radix: 16) else {
            self.init()
            return nil
        }

        switch hex.count {
        case 6:
            self.init(hex6: hexVal, alpha: alpha ?? 1.0)
        case 8:
            self.init(hex8: hexVal, alpha: alpha)
        default:
            self.init()
            return nil
        }
    }
}


