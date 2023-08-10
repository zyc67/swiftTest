//
//  DateUtils.swift
//  swiftDemo
//
//  Created by weather on 2023/6/30.
//

import Foundation

extension Date {
    var timeStamp: CLongLong {
        let timeInterval: TimeInterval = self.timeIntervalSince1970 * 1000;
        return CLongLong(timeInterval)
    }
}
