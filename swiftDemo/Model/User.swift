//
//	User.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class User : NSObject, NSCoding{

	var actTime : String!
	var balance : Int!
	var bindingInfo : BindingInfo!
	var blackUserIdList : [AnyObject]!
	var candy : Candy!
	var candyHoles : [CandyHole]!
	var club : Club!
	var count : Int!
	var gold : Gold!
	var ifGuard : Int!
	var list : [AnyObject]!
	var num : Num!
	var phoneStatus : Int!
	var rankList : [RankList]!
	var remarkName : String!
	var safe : Safe!
	var secondToken : String!
	var shop : AnyObject!
	var skin : Skin!
	var theme : Theme!
	var userInfo : UserInfo!
	var vipEndtime : String!
	var worldSkin : WorldSkin!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		actTime = dictionary["actTime"] as? String
		balance = dictionary["balance"] as? Int
		if let bindingInfoData = dictionary["bindingInfo"] as? [String:Any]{
			bindingInfo = BindingInfo(fromDictionary: bindingInfoData)
		}
		blackUserIdList = dictionary["blackUserIdList"] as? [AnyObject]
		if let candyData = dictionary["candy"] as? [String:Any]{
			candy = Candy(fromDictionary: candyData)
		}
		candyHoles = [CandyHole]()
		if let candyHolesArray = dictionary["candyHoles"] as? [[String:Any]]{
			for dic in candyHolesArray{
				let value = CandyHole(fromDictionary: dic)
				candyHoles.append(value)
			}
		}
		if let clubData = dictionary["club"] as? [String:Any]{
			club = Club(fromDictionary: clubData)
		}
		count = dictionary["count"] as? Int
		if let goldData = dictionary["gold"] as? [String:Any]{
			gold = Gold(fromDictionary: goldData)
		}
		ifGuard = dictionary["ifGuard"] as? Int
		list = dictionary["list"] as? [AnyObject]
		if let numData = dictionary["num"] as? [String:Any]{
			num = Num(fromDictionary: numData)
		}
		phoneStatus = dictionary["phoneStatus"] as? Int
		rankList = [RankList]()
		if let rankListArray = dictionary["rankList"] as? [[String:Any]]{
			for dic in rankListArray{
				let value = RankList(fromDictionary: dic)
				rankList.append(value)
			}
		}
		remarkName = dictionary["remarkName"] as? String
		if let safeData = dictionary["safe"] as? [String:Any]{
			safe = Safe(fromDictionary: safeData)
		}
		secondToken = dictionary["secondToken"] as? String
		shop = dictionary["shop"] as? AnyObject
		if let skinData = dictionary["skin"] as? [String:Any]{
			skin = Skin(fromDictionary: skinData)
		}
		if let themeData = dictionary["theme"] as? [String:Any]{
			theme = Theme(fromDictionary: themeData)
		}
		if let userInfoData = dictionary["userInfo"] as? [String:Any]{
			userInfo = UserInfo(fromDictionary: userInfoData)
		}
		vipEndtime = dictionary["vipEndtime"] as? String
		if let worldSkinData = dictionary["worldSkin"] as? [String:Any]{
			worldSkin = WorldSkin(fromDictionary: worldSkinData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if actTime != nil{
			dictionary["actTime"] = actTime
		}
		if balance != nil{
			dictionary["balance"] = balance
		}
		if bindingInfo != nil{
			dictionary["bindingInfo"] = bindingInfo.toDictionary()
		}
		if blackUserIdList != nil{
			dictionary["blackUserIdList"] = blackUserIdList
		}
		if candy != nil{
			dictionary["candy"] = candy.toDictionary()
		}
		if candyHoles != nil{
			var dictionaryElements = [[String:Any]]()
			for candyHolesElement in candyHoles {
				dictionaryElements.append(candyHolesElement.toDictionary())
			}
			dictionary["candyHoles"] = dictionaryElements
		}
		if club != nil{
			dictionary["club"] = club.toDictionary()
		}
		if count != nil{
			dictionary["count"] = count
		}
		if gold != nil{
			dictionary["gold"] = gold.toDictionary()
		}
		if ifGuard != nil{
			dictionary["ifGuard"] = ifGuard
		}
		if list != nil{
			dictionary["list"] = list
		}
		if num != nil{
			dictionary["num"] = num.toDictionary()
		}
		if phoneStatus != nil{
			dictionary["phoneStatus"] = phoneStatus
		}
		if rankList != nil{
			var dictionaryElements = [[String:Any]]()
			for rankListElement in rankList {
				dictionaryElements.append(rankListElement.toDictionary())
			}
			dictionary["rankList"] = dictionaryElements
		}
		if remarkName != nil{
			dictionary["remarkName"] = remarkName
		}
		if safe != nil{
			dictionary["safe"] = safe.toDictionary()
		}
		if secondToken != nil{
			dictionary["secondToken"] = secondToken
		}
		if shop != nil{
			dictionary["shop"] = shop
		}
		if skin != nil{
			dictionary["skin"] = skin.toDictionary()
		}
		if theme != nil{
			dictionary["theme"] = theme.toDictionary()
		}
		if userInfo != nil{
			dictionary["userInfo"] = userInfo.toDictionary()
		}
		if vipEndtime != nil{
			dictionary["vipEndtime"] = vipEndtime
		}
		if worldSkin != nil{
			dictionary["worldSkin"] = worldSkin.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         actTime = aDecoder.decodeObject(forKey: "actTime") as? String
         balance = aDecoder.decodeObject(forKey: "balance") as? Int
         bindingInfo = aDecoder.decodeObject(forKey: "bindingInfo") as? BindingInfo
         blackUserIdList = aDecoder.decodeObject(forKey: "blackUserIdList") as? [AnyObject]
         candy = aDecoder.decodeObject(forKey: "candy") as? Candy
         candyHoles = aDecoder.decodeObject(forKey :"candyHoles") as? [CandyHole]
         club = aDecoder.decodeObject(forKey: "club") as? Club
         count = aDecoder.decodeObject(forKey: "count") as? Int
         gold = aDecoder.decodeObject(forKey: "gold") as? Gold
         ifGuard = aDecoder.decodeObject(forKey: "ifGuard") as? Int
         list = aDecoder.decodeObject(forKey: "list") as? [AnyObject]
         num = aDecoder.decodeObject(forKey: "num") as? Num
         phoneStatus = aDecoder.decodeObject(forKey: "phoneStatus") as? Int
         rankList = aDecoder.decodeObject(forKey :"rankList") as? [RankList]
         remarkName = aDecoder.decodeObject(forKey: "remarkName") as? String
         safe = aDecoder.decodeObject(forKey: "safe") as? Safe
         secondToken = aDecoder.decodeObject(forKey: "secondToken") as? String
         shop = aDecoder.decodeObject(forKey: "shop") as? AnyObject
         skin = aDecoder.decodeObject(forKey: "skin") as? Skin
         theme = aDecoder.decodeObject(forKey: "theme") as? Theme
         userInfo = aDecoder.decodeObject(forKey: "userInfo") as? UserInfo
         vipEndtime = aDecoder.decodeObject(forKey: "vipEndtime") as? String
         worldSkin = aDecoder.decodeObject(forKey: "worldSkin") as? WorldSkin

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if actTime != nil{
			aCoder.encode(actTime, forKey: "actTime")
		}
		if balance != nil{
			aCoder.encode(balance, forKey: "balance")
		}
		if bindingInfo != nil{
			aCoder.encode(bindingInfo, forKey: "bindingInfo")
		}
		if blackUserIdList != nil{
			aCoder.encode(blackUserIdList, forKey: "blackUserIdList")
		}
		if candy != nil{
			aCoder.encode(candy, forKey: "candy")
		}
		if candyHoles != nil{
			aCoder.encode(candyHoles, forKey: "candyHoles")
		}
		if club != nil{
			aCoder.encode(club, forKey: "club")
		}
		if count != nil{
			aCoder.encode(count, forKey: "count")
		}
		if gold != nil{
			aCoder.encode(gold, forKey: "gold")
		}
		if ifGuard != nil{
			aCoder.encode(ifGuard, forKey: "ifGuard")
		}
		if list != nil{
			aCoder.encode(list, forKey: "list")
		}
		if num != nil{
			aCoder.encode(num, forKey: "num")
		}
		if phoneStatus != nil{
			aCoder.encode(phoneStatus, forKey: "phoneStatus")
		}
		if rankList != nil{
			aCoder.encode(rankList, forKey: "rankList")
		}
		if remarkName != nil{
			aCoder.encode(remarkName, forKey: "remarkName")
		}
		if safe != nil{
			aCoder.encode(safe, forKey: "safe")
		}
		if secondToken != nil{
			aCoder.encode(secondToken, forKey: "secondToken")
		}
		if shop != nil{
			aCoder.encode(shop, forKey: "shop")
		}
		if skin != nil{
			aCoder.encode(skin, forKey: "skin")
		}
		if theme != nil{
			aCoder.encode(theme, forKey: "theme")
		}
		if userInfo != nil{
			aCoder.encode(userInfo, forKey: "userInfo")
		}
		if vipEndtime != nil{
			aCoder.encode(vipEndtime, forKey: "vipEndtime")
		}
		if worldSkin != nil{
			aCoder.encode(worldSkin, forKey: "worldSkin")
		}

	}

}