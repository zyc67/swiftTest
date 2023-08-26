//
//  UserManager.swift
//  swiftDemo
//
//  Created by weather on 2023/8/11.
//

import Foundation

struct UserManager {
    static var shared = UserManager()
    
    var user: User?
    
    mutating func saveCurrentUser(_ userInfo: User?) {
        if userInfo != nil {
            archivedData(model: userInfo!, fileName: "userInfo.data")
            user = userInfo
        } else {
            removeArchivedData(fileName: "userInfo.data")
            user = nil
        }
    }
    
    mutating func getCurrentUser() -> User? {
        if user != nil {
            return user
        } else {
            let userInfo: User? = unarchiverData(fileName: "userInfo.data")
            user = userInfo
            return userInfo
        }
    }
    
    var userId: Int? {
        mutating get {
            if getCurrentUser()?.userId ?? 0 > 0 {
                return getCurrentUser()?.userId
            } else if getCurrentUser()?.id ?? 0 > 0 {
                return getCurrentUser()?.id
            }
            return 0
        }
    }
    
    var loginSign: String? {
        mutating get {
            getCurrentUser()?.loginSign
        }
    }
    
}
