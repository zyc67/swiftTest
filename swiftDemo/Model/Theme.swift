//
//	Theme.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Theme : NSObject, NSCoding{

	var bg : String!
	var chat : String!
	var chatChoose : String!
	var circle : String!
	var circleChoose : String!
	var circlePreview : String!
	var circleTitle : String!
	var find : String!
	var findChoose : String!
	var findPreview : String!
	var findTitle : String!
	var goodsId : Int!
	var mine : String!
	var mineChoose : String!
	var pen : String!
	var penChoose : String!
	var qianji : String!
	var qianjiChoose : String!
	var tabBg : String!
	var tabFontColor : String!
	var tabFontColorChoose : String!
	var themeId : Int!
	var themeName : String!
	var titleBg : String!
	var userId : Int!
	var zuyinPreview : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		bg = dictionary["bg"] as? String
		chat = dictionary["chat"] as? String
		chatChoose = dictionary["chatChoose"] as? String
		circle = dictionary["circle"] as? String
		circleChoose = dictionary["circleChoose"] as? String
		circlePreview = dictionary["circlePreview"] as? String
		circleTitle = dictionary["circleTitle"] as? String
		find = dictionary["find"] as? String
		findChoose = dictionary["findChoose"] as? String
		findPreview = dictionary["findPreview"] as? String
		findTitle = dictionary["findTitle"] as? String
		goodsId = dictionary["goodsId"] as? Int
		mine = dictionary["mine"] as? String
		mineChoose = dictionary["mineChoose"] as? String
		pen = dictionary["pen"] as? String
		penChoose = dictionary["penChoose"] as? String
		qianji = dictionary["qianji"] as? String
		qianjiChoose = dictionary["qianjiChoose"] as? String
		tabBg = dictionary["tabBg"] as? String
		tabFontColor = dictionary["tabFontColor"] as? String
		tabFontColorChoose = dictionary["tabFontColorChoose"] as? String
		themeId = dictionary["themeId"] as? Int
		themeName = dictionary["themeName"] as? String
		titleBg = dictionary["titleBg"] as? String
		userId = dictionary["userId"] as? Int
		zuyinPreview = dictionary["zuyinPreview"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if bg != nil{
			dictionary["bg"] = bg
		}
		if chat != nil{
			dictionary["chat"] = chat
		}
		if chatChoose != nil{
			dictionary["chatChoose"] = chatChoose
		}
		if circle != nil{
			dictionary["circle"] = circle
		}
		if circleChoose != nil{
			dictionary["circleChoose"] = circleChoose
		}
		if circlePreview != nil{
			dictionary["circlePreview"] = circlePreview
		}
		if circleTitle != nil{
			dictionary["circleTitle"] = circleTitle
		}
		if find != nil{
			dictionary["find"] = find
		}
		if findChoose != nil{
			dictionary["findChoose"] = findChoose
		}
		if findPreview != nil{
			dictionary["findPreview"] = findPreview
		}
		if findTitle != nil{
			dictionary["findTitle"] = findTitle
		}
		if goodsId != nil{
			dictionary["goodsId"] = goodsId
		}
		if mine != nil{
			dictionary["mine"] = mine
		}
		if mineChoose != nil{
			dictionary["mineChoose"] = mineChoose
		}
		if pen != nil{
			dictionary["pen"] = pen
		}
		if penChoose != nil{
			dictionary["penChoose"] = penChoose
		}
		if qianji != nil{
			dictionary["qianji"] = qianji
		}
		if qianjiChoose != nil{
			dictionary["qianjiChoose"] = qianjiChoose
		}
		if tabBg != nil{
			dictionary["tabBg"] = tabBg
		}
		if tabFontColor != nil{
			dictionary["tabFontColor"] = tabFontColor
		}
		if tabFontColorChoose != nil{
			dictionary["tabFontColorChoose"] = tabFontColorChoose
		}
		if themeId != nil{
			dictionary["themeId"] = themeId
		}
		if themeName != nil{
			dictionary["themeName"] = themeName
		}
		if titleBg != nil{
			dictionary["titleBg"] = titleBg
		}
		if userId != nil{
			dictionary["userId"] = userId
		}
		if zuyinPreview != nil{
			dictionary["zuyinPreview"] = zuyinPreview
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         bg = aDecoder.decodeObject(forKey: "bg") as? String
         chat = aDecoder.decodeObject(forKey: "chat") as? String
         chatChoose = aDecoder.decodeObject(forKey: "chatChoose") as? String
         circle = aDecoder.decodeObject(forKey: "circle") as? String
         circleChoose = aDecoder.decodeObject(forKey: "circleChoose") as? String
         circlePreview = aDecoder.decodeObject(forKey: "circlePreview") as? String
         circleTitle = aDecoder.decodeObject(forKey: "circleTitle") as? String
         find = aDecoder.decodeObject(forKey: "find") as? String
         findChoose = aDecoder.decodeObject(forKey: "findChoose") as? String
         findPreview = aDecoder.decodeObject(forKey: "findPreview") as? String
         findTitle = aDecoder.decodeObject(forKey: "findTitle") as? String
         goodsId = aDecoder.decodeObject(forKey: "goodsId") as? Int
         mine = aDecoder.decodeObject(forKey: "mine") as? String
         mineChoose = aDecoder.decodeObject(forKey: "mineChoose") as? String
         pen = aDecoder.decodeObject(forKey: "pen") as? String
         penChoose = aDecoder.decodeObject(forKey: "penChoose") as? String
         qianji = aDecoder.decodeObject(forKey: "qianji") as? String
         qianjiChoose = aDecoder.decodeObject(forKey: "qianjiChoose") as? String
         tabBg = aDecoder.decodeObject(forKey: "tabBg") as? String
         tabFontColor = aDecoder.decodeObject(forKey: "tabFontColor") as? String
         tabFontColorChoose = aDecoder.decodeObject(forKey: "tabFontColorChoose") as? String
         themeId = aDecoder.decodeObject(forKey: "themeId") as? Int
         themeName = aDecoder.decodeObject(forKey: "themeName") as? String
         titleBg = aDecoder.decodeObject(forKey: "titleBg") as? String
         userId = aDecoder.decodeObject(forKey: "userId") as? Int
         zuyinPreview = aDecoder.decodeObject(forKey: "zuyinPreview") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if bg != nil{
			aCoder.encode(bg, forKey: "bg")
		}
		if chat != nil{
			aCoder.encode(chat, forKey: "chat")
		}
		if chatChoose != nil{
			aCoder.encode(chatChoose, forKey: "chatChoose")
		}
		if circle != nil{
			aCoder.encode(circle, forKey: "circle")
		}
		if circleChoose != nil{
			aCoder.encode(circleChoose, forKey: "circleChoose")
		}
		if circlePreview != nil{
			aCoder.encode(circlePreview, forKey: "circlePreview")
		}
		if circleTitle != nil{
			aCoder.encode(circleTitle, forKey: "circleTitle")
		}
		if find != nil{
			aCoder.encode(find, forKey: "find")
		}
		if findChoose != nil{
			aCoder.encode(findChoose, forKey: "findChoose")
		}
		if findPreview != nil{
			aCoder.encode(findPreview, forKey: "findPreview")
		}
		if findTitle != nil{
			aCoder.encode(findTitle, forKey: "findTitle")
		}
		if goodsId != nil{
			aCoder.encode(goodsId, forKey: "goodsId")
		}
		if mine != nil{
			aCoder.encode(mine, forKey: "mine")
		}
		if mineChoose != nil{
			aCoder.encode(mineChoose, forKey: "mineChoose")
		}
		if pen != nil{
			aCoder.encode(pen, forKey: "pen")
		}
		if penChoose != nil{
			aCoder.encode(penChoose, forKey: "penChoose")
		}
		if qianji != nil{
			aCoder.encode(qianji, forKey: "qianji")
		}
		if qianjiChoose != nil{
			aCoder.encode(qianjiChoose, forKey: "qianjiChoose")
		}
		if tabBg != nil{
			aCoder.encode(tabBg, forKey: "tabBg")
		}
		if tabFontColor != nil{
			aCoder.encode(tabFontColor, forKey: "tabFontColor")
		}
		if tabFontColorChoose != nil{
			aCoder.encode(tabFontColorChoose, forKey: "tabFontColorChoose")
		}
		if themeId != nil{
			aCoder.encode(themeId, forKey: "themeId")
		}
		if themeName != nil{
			aCoder.encode(themeName, forKey: "themeName")
		}
		if titleBg != nil{
			aCoder.encode(titleBg, forKey: "titleBg")
		}
		if userId != nil{
			aCoder.encode(userId, forKey: "userId")
		}
		if zuyinPreview != nil{
			aCoder.encode(zuyinPreview, forKey: "zuyinPreview")
		}

	}

}