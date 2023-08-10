//
//	UserInfo.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class UserInfo : NSObject, NSCoding{

	var addr : String!
	var age : Int!
	var authStatus : Int!
	var avtar : String!
	var birthday : String!
	var constellation : String!
	var diaryNum : Int!
	var diaryNumSum : Int!
	var growup : Int!
	var hasTeenagerPassword : Int!
	var hasUsedInviteCode : Int!
	var ifNewUser : Int!
	var ipAddress : String!
	var isTeenager : Int!
	var job : String!
	var lightStatus : Int!
	var loginSign : String!
	var lvl : Int!
	var message : AnyObject!
	var nickname : String!
	var onlyPhone : Int!
	var permanentVip : Int!
	var realBirthday : String!
	var realNickname : String!
	var sex : Int!
	var sign : String!
	var slvl : Int!
	var suffixLvl : Int!
	var tags : String!
	var teenagerMode : Int!
	var userId : Int!
	var vip : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		addr = dictionary["addr"] as? String
		age = dictionary["age"] as? Int
		authStatus = dictionary["authStatus"] as? Int
		avtar = dictionary["avtar"] as? String
		birthday = dictionary["birthday"] as? String
		constellation = dictionary["constellation"] as? String
		diaryNum = dictionary["diaryNum"] as? Int
		diaryNumSum = dictionary["diaryNumSum"] as? Int
		growup = dictionary["growup"] as? Int
		hasTeenagerPassword = dictionary["hasTeenagerPassword"] as? Int
		hasUsedInviteCode = dictionary["hasUsedInviteCode"] as? Int
		ifNewUser = dictionary["ifNewUser"] as? Int
		ipAddress = dictionary["ipAddress"] as? String
		isTeenager = dictionary["isTeenager"] as? Int
		job = dictionary["job"] as? String
		lightStatus = dictionary["lightStatus"] as? Int
		loginSign = dictionary["loginSign"] as? String
		lvl = dictionary["lvl"] as? Int
		message = dictionary["message"] as? AnyObject
		nickname = dictionary["nickname"] as? String
		onlyPhone = dictionary["onlyPhone"] as? Int
		permanentVip = dictionary["permanentVip"] as? Int
		realBirthday = dictionary["realBirthday"] as? String
		realNickname = dictionary["realNickname"] as? String
		sex = dictionary["sex"] as? Int
		sign = dictionary["sign"] as? String
		slvl = dictionary["slvl"] as? Int
		suffixLvl = dictionary["suffixLvl"] as? Int
		tags = dictionary["tags"] as? String
		teenagerMode = dictionary["teenagerMode"] as? Int
		userId = dictionary["userId"] as? Int
		vip = dictionary["vip"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if addr != nil{
			dictionary["addr"] = addr
		}
		if age != nil{
			dictionary["age"] = age
		}
		if authStatus != nil{
			dictionary["authStatus"] = authStatus
		}
		if avtar != nil{
			dictionary["avtar"] = avtar
		}
		if birthday != nil{
			dictionary["birthday"] = birthday
		}
		if constellation != nil{
			dictionary["constellation"] = constellation
		}
		if diaryNum != nil{
			dictionary["diaryNum"] = diaryNum
		}
		if diaryNumSum != nil{
			dictionary["diaryNumSum"] = diaryNumSum
		}
		if growup != nil{
			dictionary["growup"] = growup
		}
		if hasTeenagerPassword != nil{
			dictionary["hasTeenagerPassword"] = hasTeenagerPassword
		}
		if hasUsedInviteCode != nil{
			dictionary["hasUsedInviteCode"] = hasUsedInviteCode
		}
		if ifNewUser != nil{
			dictionary["ifNewUser"] = ifNewUser
		}
		if ipAddress != nil{
			dictionary["ipAddress"] = ipAddress
		}
		if isTeenager != nil{
			dictionary["isTeenager"] = isTeenager
		}
		if job != nil{
			dictionary["job"] = job
		}
		if lightStatus != nil{
			dictionary["lightStatus"] = lightStatus
		}
		if loginSign != nil{
			dictionary["loginSign"] = loginSign
		}
		if lvl != nil{
			dictionary["lvl"] = lvl
		}
		if message != nil{
			dictionary["message"] = message
		}
		if nickname != nil{
			dictionary["nickname"] = nickname
		}
		if onlyPhone != nil{
			dictionary["onlyPhone"] = onlyPhone
		}
		if permanentVip != nil{
			dictionary["permanentVip"] = permanentVip
		}
		if realBirthday != nil{
			dictionary["realBirthday"] = realBirthday
		}
		if realNickname != nil{
			dictionary["realNickname"] = realNickname
		}
		if sex != nil{
			dictionary["sex"] = sex
		}
		if sign != nil{
			dictionary["sign"] = sign
		}
		if slvl != nil{
			dictionary["slvl"] = slvl
		}
		if suffixLvl != nil{
			dictionary["suffixLvl"] = suffixLvl
		}
		if tags != nil{
			dictionary["tags"] = tags
		}
		if teenagerMode != nil{
			dictionary["teenagerMode"] = teenagerMode
		}
		if userId != nil{
			dictionary["userId"] = userId
		}
		if vip != nil{
			dictionary["vip"] = vip
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         addr = aDecoder.decodeObject(forKey: "addr") as? String
         age = aDecoder.decodeObject(forKey: "age") as? Int
         authStatus = aDecoder.decodeObject(forKey: "authStatus") as? Int
         avtar = aDecoder.decodeObject(forKey: "avtar") as? String
         birthday = aDecoder.decodeObject(forKey: "birthday") as? String
         constellation = aDecoder.decodeObject(forKey: "constellation") as? String
         diaryNum = aDecoder.decodeObject(forKey: "diaryNum") as? Int
         diaryNumSum = aDecoder.decodeObject(forKey: "diaryNumSum") as? Int
         growup = aDecoder.decodeObject(forKey: "growup") as? Int
         hasTeenagerPassword = aDecoder.decodeObject(forKey: "hasTeenagerPassword") as? Int
         hasUsedInviteCode = aDecoder.decodeObject(forKey: "hasUsedInviteCode") as? Int
         ifNewUser = aDecoder.decodeObject(forKey: "ifNewUser") as? Int
         ipAddress = aDecoder.decodeObject(forKey: "ipAddress") as? String
         isTeenager = aDecoder.decodeObject(forKey: "isTeenager") as? Int
         job = aDecoder.decodeObject(forKey: "job") as? String
         lightStatus = aDecoder.decodeObject(forKey: "lightStatus") as? Int
         loginSign = aDecoder.decodeObject(forKey: "loginSign") as? String
         lvl = aDecoder.decodeObject(forKey: "lvl") as? Int
         message = aDecoder.decodeObject(forKey: "message") as? AnyObject
         nickname = aDecoder.decodeObject(forKey: "nickname") as? String
         onlyPhone = aDecoder.decodeObject(forKey: "onlyPhone") as? Int
         permanentVip = aDecoder.decodeObject(forKey: "permanentVip") as? Int
         realBirthday = aDecoder.decodeObject(forKey: "realBirthday") as? String
         realNickname = aDecoder.decodeObject(forKey: "realNickname") as? String
         sex = aDecoder.decodeObject(forKey: "sex") as? Int
         sign = aDecoder.decodeObject(forKey: "sign") as? String
         slvl = aDecoder.decodeObject(forKey: "slvl") as? Int
         suffixLvl = aDecoder.decodeObject(forKey: "suffixLvl") as? Int
         tags = aDecoder.decodeObject(forKey: "tags") as? String
         teenagerMode = aDecoder.decodeObject(forKey: "teenagerMode") as? Int
         userId = aDecoder.decodeObject(forKey: "userId") as? Int
         vip = aDecoder.decodeObject(forKey: "vip") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if addr != nil{
			aCoder.encode(addr, forKey: "addr")
		}
		if age != nil{
			aCoder.encode(age, forKey: "age")
		}
		if authStatus != nil{
			aCoder.encode(authStatus, forKey: "authStatus")
		}
		if avtar != nil{
			aCoder.encode(avtar, forKey: "avtar")
		}
		if birthday != nil{
			aCoder.encode(birthday, forKey: "birthday")
		}
		if constellation != nil{
			aCoder.encode(constellation, forKey: "constellation")
		}
		if diaryNum != nil{
			aCoder.encode(diaryNum, forKey: "diaryNum")
		}
		if diaryNumSum != nil{
			aCoder.encode(diaryNumSum, forKey: "diaryNumSum")
		}
		if growup != nil{
			aCoder.encode(growup, forKey: "growup")
		}
		if hasTeenagerPassword != nil{
			aCoder.encode(hasTeenagerPassword, forKey: "hasTeenagerPassword")
		}
		if hasUsedInviteCode != nil{
			aCoder.encode(hasUsedInviteCode, forKey: "hasUsedInviteCode")
		}
		if ifNewUser != nil{
			aCoder.encode(ifNewUser, forKey: "ifNewUser")
		}
		if ipAddress != nil{
			aCoder.encode(ipAddress, forKey: "ipAddress")
		}
		if isTeenager != nil{
			aCoder.encode(isTeenager, forKey: "isTeenager")
		}
		if job != nil{
			aCoder.encode(job, forKey: "job")
		}
		if lightStatus != nil{
			aCoder.encode(lightStatus, forKey: "lightStatus")
		}
		if loginSign != nil{
			aCoder.encode(loginSign, forKey: "loginSign")
		}
		if lvl != nil{
			aCoder.encode(lvl, forKey: "lvl")
		}
		if message != nil{
			aCoder.encode(message, forKey: "message")
		}
		if nickname != nil{
			aCoder.encode(nickname, forKey: "nickname")
		}
		if onlyPhone != nil{
			aCoder.encode(onlyPhone, forKey: "onlyPhone")
		}
		if permanentVip != nil{
			aCoder.encode(permanentVip, forKey: "permanentVip")
		}
		if realBirthday != nil{
			aCoder.encode(realBirthday, forKey: "realBirthday")
		}
		if realNickname != nil{
			aCoder.encode(realNickname, forKey: "realNickname")
		}
		if sex != nil{
			aCoder.encode(sex, forKey: "sex")
		}
		if sign != nil{
			aCoder.encode(sign, forKey: "sign")
		}
		if slvl != nil{
			aCoder.encode(slvl, forKey: "slvl")
		}
		if suffixLvl != nil{
			aCoder.encode(suffixLvl, forKey: "suffixLvl")
		}
		if tags != nil{
			aCoder.encode(tags, forKey: "tags")
		}
		if teenagerMode != nil{
			aCoder.encode(teenagerMode, forKey: "teenagerMode")
		}
		if userId != nil{
			aCoder.encode(userId, forKey: "userId")
		}
		if vip != nil{
			aCoder.encode(vip, forKey: "vip")
		}

	}

}