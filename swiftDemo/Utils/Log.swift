//
//  Log.swift
//  swiftDemo
//
//  Created by weather on 2023/8/10.
//

import Foundation

public protocol LogLevel {
    func myDescription(level: Int) -> String
}

//封装的日志输出功能（T表示不指定日志信息参数类型）
public func ZYCLog<T>(_ message:T, file:String = #file, function:String = #function,
                     line:Int = #line) {
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent
    //日志内容
    var consoleStr = ""
    if message is Dictionary<String, Any> {
        consoleStr = "【\(fileName):line:\(line)】message:\((message as! Dictionary<String, Any>).myDescription(level: 0))"
    } else if message is Array<Any> {
        consoleStr = "【\(fileName):line:\(line)】message:\((message as! Array<Any> ).myDescription(level: 0))"
    } else if message is CustomStringConvertible {
        consoleStr = "【\(fileName):line:\(line)】message:\((message as! CustomStringConvertible).description)"
    } else {
        consoleStr = "【\(fileName):line:\(line)】message:\(message)"
    }
    
    print(consoleStr)

    // 创建一个日期格式器
    let dformatter = DateFormatter()

    // 为日期格式器设置格式字符串

    dformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

    // 使用日期格式器格式化当前日期、时间
    let datestr = dformatter.string(from: Date())
    
    //将内容同步写到文件中去(Caches文件夹下)

    let cachePath = FileManager.default.urls(for: .cachesDirectory,

    in: .userDomainMask)[0]

    let logURL = cachePath.appendingPathComponent("log.txt")

    appendText(fileURL: logURL, string: "\(datestr) \(consoleStr)")
    #endif
}

//在文件末尾追加新内容

func appendText(fileURL: URL, string: String) {
    
    do {
        
        //如果文件不存在则新建一个
        
        if !FileManager.default.fileExists(atPath: fileURL.path) {
            
            FileManager.default.createFile(atPath: fileURL.path, contents: nil)
            
        }
        
        let fileHandle = try FileHandle(forWritingTo: fileURL)
        
        let stringToWrite = "\n" + string
        
        //找到末尾位置并添加
        fileHandle.seekToEndOfFile()
        
        fileHandle.write(stringToWrite.data(using: String.Encoding.utf8)!)
        
    } catch let error as NSError {
        
        print("failed to append: \(error)")
        
    }
    
}

// MARK: - 重写可选型description
extension Optional: CustomStringConvertible {
    public var description: String {
        switch self {
        case .none:
            return "Optional(null)"
        case .some(let obj):
            if let obj = obj as? CustomStringConvertible, obj is Dictionary<String, Any> {
                return "Optional:" + "\((obj as! Dictionary<String, Any>).myDescription(level: 0))"
            }
            if let obj = obj as? CustomStringConvertible, obj is Array<Any> {
                return "Optional:" + "\((obj as! Array<Any>).myDescription(level: 0))"
            }
            return  "Optional" + "(\(obj))"
        }
    }
}

// MARK: - 重写字典型description
extension Dictionary: LogLevel {
    public var description: String {
        var str = ""
        str.append(contentsOf: "{\n")
        for (key, value) in self {
            if value is String {
                let s = value as! String
                str.append(contentsOf: String.init(format: "\t%@ = \"%@\",\n", key as! CVarArg, s.unicodeStr))
            }else if value is Dictionary {
                str.append(contentsOf: String.init(format: "\t%@ = \"%@\",\n", key as! CVarArg, (value as! Dictionary).description))
            }else if value is Array<Any> {
                str.append(contentsOf: String.init(format: "\t%@ = \"%@\",\n", key as! CVarArg, (value as! Array<Any>).description))
            }else {
                str.append(contentsOf: String.init(format: "\t%@ = \"%@\",\n", key as! CVarArg, "\(value)"))
            }
        }
        str.append(contentsOf: "}")
        return str
    }
    
    public func myDescription(level: Int) -> String{
        var str = ""
        var tab = ""
        for _ in 0..<level {
            tab.append(contentsOf: "\t")
        }
        str.append(contentsOf: "{\n")
        for (key, value) in self {
            if value is String {
                let s = value as! String
                str.append(contentsOf: String.init(format: "%@\t%@ = \"%@\",\n", tab, key as! CVarArg, s.unicodeStrWith(level: level)))
            }else if value is Dictionary {
                str.append(contentsOf: String.init(format: "%@\t%@ = %@,\n", tab, key as! CVarArg, (value as! Dictionary).myDescription(level: level + 1)))
            }else if value is Array<Any> {
                str.append(contentsOf: String.init(format: "%@\t%@ = %@,\n", tab, key as! CVarArg, (value as! Array<Any>).myDescription(level: level + 1)))
            }else {
                str.append(contentsOf: String.init(format: "%@\t%@ = %@,\n", tab, key as! CVarArg, "\(value)"))
            }
        }
        str.append(contentsOf: String.init(format: "%@}", tab))
        return str
    }
}

extension Array: LogLevel {
    public func myDescription(level: Int) -> String {
        var str = ""
        var tab = ""
        str.append(contentsOf: "[\n")
        for _ in 0..<level {
            tab.append(contentsOf: "\t")
        }
        for (_, value) in self.enumerated() {
            if value is String {
                let s = value as! String
                str.append(contentsOf: String.init(format: "%@\t\"%@\",\n", tab, s.unicodeStrWith(level: level)))
            }else if value is Dictionary<String, Any> {
                str.append(contentsOf: String.init(format: "%@\t%@,\n", tab, (value as! Dictionary<String, Any>).myDescription(level: level + 1)))
            }else if value is Array<Any> {
                str.append(contentsOf: String.init(format: "%@\t%@,\n", tab, (value as! Array<Any>).myDescription(level: level + 1)))
            }else {
                str.append(contentsOf: String.init(format: "%@\t%@,\n", tab, "\(value)"))
            }
        }
        str.append(contentsOf: String.init(format: "%@]", tab))
        return str
    }
    
    public var description: String {
        var str = ""
        str.append(contentsOf: "[\n")
        for (_, value) in self.enumerated() {
            if value is String {
                let s = value as! String
                str.append(contentsOf: String.init(format: "\t\"%@\",\n", s.unicodeStr))
            }else if value is Dictionary<String, Any> {
                str.append(contentsOf: String.init(format: "\t%@,\n", (value as! Dictionary<String, Any>).description))
            }else if value is Array<Any> {
                str.append(contentsOf: String.init(format: "\t%@,\n", (value as! Array<Any>).description))
            }else {
                str.append(contentsOf: String.init(format: "\t%@,\n", "\(value)"))
            }
        }
        str.append(contentsOf: "]")
        return str
    }
}

// MARK: - unicode转码
extension String {
    func unicodeStrWith(level: Int) -> String {
        let s = self
        let data = s.data(using: .utf8)
        if let data = data {
            if let id = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) {
                if id is Array<Any> {
                    return (id as! Array<Any>).myDescription(level: level + 1)
                }else if id is Dictionary<String, Any> {
                    return (id as! Dictionary<String, Any>).myDescription(level: level + 1)
                }
            }
        }
        let tempStr1 = self.replacingOccurrences(of: "\\u", with: "\\U")
        let tempStr2 = tempStr1.replacingOccurrences(of: "\"", with: "\\\"")
        let tempStr3 = "\"".appending(tempStr2).appending("\"")
        let tempData = tempStr3.data(using: String.Encoding.utf8)
        var returnStr:String = ""
        do {
            returnStr = try PropertyListSerialization.propertyList(from: tempData!, options: [.mutableContainers], format: nil) as! String
        } catch {
            print(error)
        }
        return returnStr.replacingOccurrences(of: "\\r\\n", with: "\n")
    }
    var unicodeStr:String {
        return self.unicodeStrWith(level: 1)
    }
}
