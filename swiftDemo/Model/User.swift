//
//	UserInfo.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import SwiftyJSON

class User: NSObject, Model, NSSecureCoding {
    var userId : Int!
    var id : Int! // user_id
    var nickname : String!
    var sex : Int!
    var age : Int!
    var birthday : String!
    var constellation : String!
	var addr : String!
    var avtar : String!
    var sign : String!
    var lvl : Int!
    var slvl : Int!
    var suffixLvl : Int!
    var joinClub : Int!
    var ifPresident : Int!
    var ifGuard : Int!
    var clubName : String!
    var growup : Int!
    var vip : Int!
    var createTime : String!
    var actTime : String!
    var status : Int!
    var avatarFrame : String!
    var lightStatus : Int!
    var teenagermMode : Int!
    var diaryNum : Int!
    var diaryNumSum : Int!
    var hasTeenagerPassword : Int!
    var realBirthday : String!
    var ipAddress : String!
    var loginSign : String!
    var onlyPhone : Int!
    var tags : String!
    var message : String!
    var ifNewUser : Int!
    var job : String!
    var permanentVip : Int!
    var realNickname : String!
    var authStatus : Int!
    var teenagerMode : Int!
    var hasUsedInviteCode : Int!
    var isTeenager : Int!
    
    required init(jsonData: JSON) {
        userId = jsonData["userId"].intValue
        id = jsonData["user_id"].intValue
        nickname = jsonData["nickname"].stringValue
        sex = jsonData["sex"].intValue
        age = jsonData["age"].intValue
        birthday = jsonData["birthday"].stringValue
        constellation = jsonData["constellation"].stringValue
        addr = jsonData["addr"].stringValue
        avtar = jsonData["avtar"].stringValue
        sign = jsonData["sign"].stringValue
        lvl = jsonData["lvl"].intValue
        slvl = jsonData["slvl"].intValue
        suffixLvl = jsonData["suffix_lvl"].intValue
        joinClub = jsonData["join_club"].intValue
        ifPresident = jsonData["ifPresident"].intValue
        ifGuard = jsonData["ifGuard"].intValue
        clubName = jsonData["clubName"].stringValue
        growup = jsonData["growup"].intValue
        vip = jsonData["vip"].intValue
        createTime = jsonData["create_time"].stringValue
        actTime = jsonData["act_time"].stringValue
        status = jsonData["status"].intValue
        avatarFrame = jsonData["avatarFrame"].stringValue
        lightStatus = jsonData["lightStatus"].intValue
        teenagermMode = jsonData["teenager_mode"].intValue
        diaryNum = jsonData["diaryNum"].intValue
        diaryNumSum = jsonData["diaryNumSum"].intValue
        hasTeenagerPassword = jsonData["hasTeenagerPassword"].intValue
        realBirthday = jsonData["real_birthday"].stringValue
        ipAddress = jsonData["ipAddress"].stringValue
        loginSign = jsonData["loginSign"].stringValue
        onlyPhone = jsonData["onlyPhone"].intValue
        tags = jsonData["tags"].stringValue
        message = jsonData["message"].stringValue
        ifNewUser = jsonData["ifNewUser"].intValue
        job = jsonData["job"].stringValue
        permanentVip = jsonData["permanentVip"].intValue
        realNickname = jsonData["realNickname"].stringValue
        teenagerMode = jsonData["teenagerMode"].intValue
        isTeenager = jsonData["isTeenager"].intValue
    }
    
    static var supportsSecureCoding: Bool = true
    
    func encode(with coder: NSCoder) {
        coder.encode(userId, forKey: "userId")
        coder.encode(id, forKey: "user_id")
        coder.encode(nickname, forKey: "nickname")
        coder.encode(sex, forKey: "sex")
        coder.encode(age, forKey: "age")
        coder.encode(birthday, forKey: "birthday")
        coder.encode(constellation, forKey: "constellation")
        coder.encode(addr, forKey: "addr")
        coder.encode(avtar, forKey: "avtar")
        coder.encode(sign, forKey: "sign")
        coder.encode(lvl, forKey: "lvl")
        coder.encode(slvl, forKey: "slvl")
        coder.encode(suffixLvl, forKey: "suffix_lvl")
        coder.encode(joinClub, forKey: "join_club")
        coder.encode(ifPresident, forKey: "ifPresident")
        coder.encode(ifGuard, forKey: "ifGuard")
        coder.encode(clubName, forKey: "clubName")
        coder.encode(growup, forKey: "growup")
        coder.encode(vip, forKey: "vip")
        coder.encode(createTime, forKey: "create_time")
        coder.encode(actTime, forKey: "act_time")
        coder.encode(status, forKey: "status")
        coder.encode(avatarFrame, forKey: "avatarFrame")
        coder.encode(lightStatus, forKey: "lightStatus")
        coder.encode(teenagermMode, forKey: "teenager_mode")
        coder.encode(diaryNum, forKey: "diaryNum")
        coder.encode(diaryNumSum, forKey: "diaryNumSum")
        coder.encode(hasTeenagerPassword, forKey: "hasTeenagerPassword")
        coder.encode(realBirthday, forKey: "real_birthday")
        coder.encode(ipAddress, forKey: "ipAddress")
        coder.encode(loginSign, forKey: "loginSign")
        coder.encode(onlyPhone, forKey: "onlyPhone")
        coder.encode(tags, forKey: "tags")
        coder.encode(message, forKey: "message")
        coder.encode(ifNewUser, forKey: "ifNewUser")
        coder.encode(job, forKey: "job")
        coder.encode(permanentVip, forKey: "permanentVip")
        coder.encode(realNickname, forKey: "realNickname")
        coder.encode(teenagerMode, forKey: "teenagerMode")
        coder.encode(isTeenager, forKey: "isTeenager")
    }
    
    required init?(coder: NSCoder) {
        userId = coder.decodeObject(forKey: "userId") as? Int
        id = coder.decodeObject(forKey: "user_id") as? Int
        nickname = coder.decodeObject(forKey: "nickname") as? String
        sex = coder.decodeObject(forKey: "sex") as? Int
        age = coder.decodeObject(forKey: "age") as? Int
        birthday = coder.decodeObject(forKey: "birthday") as? String
        constellation = coder.decodeObject(forKey: "constellation") as? String
        addr = coder.decodeObject(forKey: "addr") as? String
        avtar = coder.decodeObject(forKey: "avtar") as? String
        sign = coder.decodeObject(forKey: "sign") as? String
        lvl = coder.decodeObject(forKey: "lvl") as? Int
        slvl = coder.decodeObject(forKey: "slvl") as? Int
        suffixLvl = coder.decodeObject(forKey: "suffix_lvl") as? Int
        joinClub = coder.decodeObject(forKey: "join_club") as? Int
        ifPresident = coder.decodeObject(forKey: "ifPresident") as? Int
        ifGuard = coder.decodeObject(forKey: "ifGuard") as? Int
        clubName = coder.decodeObject(forKey: "clubName") as? String
        growup = coder.decodeObject(forKey: "growup") as? Int
        vip = coder.decodeObject(forKey: "vip") as? Int
        createTime = coder.decodeObject(forKey: "create_time") as? String
        actTime = coder.decodeObject(forKey: "act_time") as? String
        status = coder.decodeObject(forKey: "status") as? Int
        avatarFrame = coder.decodeObject(forKey: "avatarFrame") as? String
        lightStatus = coder.decodeObject(forKey: "lightStatus") as? Int
        teenagermMode = coder.decodeObject(forKey: "teenager_mode") as? Int
        diaryNum = coder.decodeObject(forKey: "diaryNum") as? Int
        diaryNumSum = coder.decodeObject(forKey: "diaryNumSum") as? Int
        hasTeenagerPassword = coder.decodeObject(forKey: "hasTeenagerPassword") as? Int
        realBirthday = coder.decodeObject(forKey: "real_birthday") as? String
        ipAddress = coder.decodeObject(forKey: "ipAddress") as? String
        loginSign = coder.decodeObject(forKey: "loginSign") as? String
        onlyPhone = coder.decodeObject(forKey: "onlyPhone") as? Int
        tags = coder.decodeObject(forKey: "tags") as? String
        message = coder.decodeObject(forKey: "message") as? String
        ifNewUser = coder.decodeObject(forKey: "ifNewUser") as? Int
        job = coder.decodeObject(forKey: "job") as? String
        permanentVip = coder.decodeObject(forKey: "permanentVip") as? Int
        realNickname = coder.decodeObject(forKey: "realNickname") as? String
        teenagerMode = coder.decodeObject(forKey: "teenagerMode") as? Int
        isTeenager = coder.decodeObject(forKey: "isTeenager") as? Int
    }
}
