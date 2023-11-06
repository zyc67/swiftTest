//
//  FileUtils.swift
//  swiftDemo
//
//  Created by weather on 2023/8/10.
//

import Foundation

func removeArchivedData(fileName: String) {
    // 路径
    let file = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
    let filePath = (file as NSString).appendingPathComponent(fileName)
    try? FileManager.default.removeItem(atPath: filePath)
}

func archivedData(model: Any, fileName: String) {
    // 路径
    let file = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
    // 拼接路径 自动带斜杠的
    let filePath = (file as NSString).appendingPathComponent(fileName)
    // 保存
    do {
        let data: Data
        if #available(iOS 11, *) {
            // TODO: model一定要继承NSObject吗？
            data = try NSKeyedArchiver.archivedData(withRootObject: model, requiringSecureCoding: true)
        } else {
            data = NSKeyedArchiver.archivedData(withRootObject: model)
        }
        
        do {
            _ = try data.write(to: URL(fileURLWithPath: filePath))
            LogInfo("写入成功")
        } catch {
            LogError("data写入本地失败: \(error)")
        }
    } catch  {
        LogError("模型转data失败: \(error)")
    }
}

//func unarchiverData<T: NSObject & NSCoding>(fileName: String) -> T? {
//    // 路径
//    let file = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
//    // 拼接路径 自动带斜杠的
//    let filePath = (file as NSString).appendingPathComponent(fileName)
//    guard FileManager.default.fileExists(atPath: filePath) else {
//        return nil
//    }
//    do {
//        let data = try Data.init(contentsOf: URL(fileURLWithPath: filePath))
//        // 当用户首次登陆, 直接从沙盒获取数据, 就会为nil  所以这里需要使用as?
//        let model = try NSKeyedUnarchiver.unarchivedObject(ofClasses: [T.self, NSNull.self], from: data) as? T
//        return model
//    } catch {
//        LogError("获取data数据失败: \(error)")
//    }
//    return nil
//}

func unarchiverData<T>(fileName: String) -> T? {
    // 路径
    let file = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
    // 拼接路径 自动带斜杠的
    let filePath = (file as NSString).appendingPathComponent(fileName)
    guard FileManager.default.fileExists(atPath: filePath) else {
        return nil
    }
    do {
        let data = try Data.init(contentsOf: URL(fileURLWithPath: filePath))
        // 当用户首次登陆, 直接从沙盒获取数据, 就会为nil  所以这里需要使用as?
        // TODO: 方法过期
        let model = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? T
        return model
    } catch {
        LogError("获取data数据失败: \(error)")
    }
    return nil
}
