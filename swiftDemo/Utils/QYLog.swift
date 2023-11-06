//
//  QYLog.swift
//  swiftDemo
//
//  Created by weather on 2023/11/6.
//

import Foundation
import CocoaLumberjackSwift

// MARK: Debug
public func LogDebug(file:String = #file, function:String = #function, line:Int = #line, _ msgs: Any...) {
    let fileName = ((file as NSString).deletingPathExtension as NSString).lastPathComponent
    DDLogDebug("【\(fileName)】【\(function)】【line_\(line)】【Debug】\(msgs)")
}

// MARK: Info
public func LogInfo(file:String = #file, function:String = #function, line:Int = #line, _ msgs: Any...) {
    let fileName = ((file as NSString).deletingPathExtension as NSString).lastPathComponent
    DDLogInfo("【\(fileName)】【\(function)】【line_\(line)】【Info】\(msgs)")
}
  
// MARK: Error
public func LogError(file:String = #file, function:String = #function, line:Int = #line, _ msgs: Any...) {
    let fileName = ((file as NSString).deletingPathExtension as NSString).lastPathComponent
    DDLogError("【\(fileName)】【\(function)】【line_\(line)】【Error】\(msgs)")
}

class QYLog: NSObject {
    static let sharedInstance = QYLog()
    
    func initLog() {
        #if DEBUG
        DDLog.add(DDOSLogger.sharedInstance) // 控制台打印
        #endif
        
//        var path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
//        path += "/log/"
//        let fileLogger = DDFileLogger(logFileManager: QYLogFileManager(logsDirectory: path))
        
        let fileLogger = DDFileLogger(logFileManager: QYLogFileManager())
        fileLogger.rollingFrequency = 24*60*60 // 24小时
        fileLogger.maximumFileSize = 0
        fileLogger.logFileManager.maximumNumberOfLogFiles = 5
        fileLogger.logFileManager.logFilesDiskQuota = 20*1024*1024 //最多保存20M
        fileLogger.logFormatter = self
        DDLog.add(fileLogger)
    }
}

extension QYLog: DDLogFormatter {
    func format(message logMessage: DDLogMessage) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss:SSS"
        let timeStamp = dateFormatter.string(from: NSDate() as Date)
        
//        let formatLog = "\(timeStamp)【className_\(logMessage.fileName)】【func \(logMessage.function ?? "")】【line_\(logMessage.line)】\(logMessage.message)";
        let formatLog = "\(timeStamp)\(logMessage.message)"
        return formatLog;
    }
}

class QYLogFileManager: DDLogFileManagerDefault {
    override func isLogFile(withName fileName: String) -> Bool {
        return fileName.hasSuffix(".log")
    }
    
    override var newLogFileName: String {
        set {}
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss" // 这里的文件名要带上时分秒，要不然超过配置文件会被覆盖
            let time = dateFormatter.string(from: NSDate() as Date)
            return "qianyan_\(time).log"
        }
    }
}
