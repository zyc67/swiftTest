//
//  DataUtils.swift
//  swiftDemo
//
//  Created by weather on 2023/6/30.
//

import Foundation

extension Data {
//    var dataToDictionary: [String: Any]? {
//        do {
//            let json = try JSONSerialization.jsonObject(with: self, options: .mutableContainers)
//            let dict = json as? [String: Any]
//            return dict
//        } catch {
//            return nil
//        }
//    }
    
    var dataToJson: Any? {
        do {
            return try JSONSerialization.jsonObject(with: self, options: .mutableContainers)
        } catch {
            return nil
        }
    }
}

extension Data {
    var bytes: [UInt8] {
        return [UInt8](self)
    }
}
