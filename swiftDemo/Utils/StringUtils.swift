//
//  StringUtils.swift
//  swiftDemo
//
//  Created by weather on 2023/6/30.
//

import Foundation
import CommonCrypto

extension String {
    var hmacSha256: String {
        let cKey = netWorkKey.data(using: .utf8)
        let cData = self.cString(using: .utf8)
        var result = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        CCHmac(CCHmacAlgorithm(kCCHmacAlgSHA256), cKey?.bytes, cKey?.count ?? 0, cData, strlen(cData!), &result);
        return result.reduce("") { $0 + String(format:"%02x", $1) }
    }
}

extension String {
    var bytes: [UInt8] {
        return [UInt8](self.utf8)
    }
}

