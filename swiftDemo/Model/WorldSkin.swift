//
//	WorldSkin.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class WorldSkin : NSObject, NSCoding{

	var goodsId : Int!
	var id : Int!
	var previewImg : String!
	var url : String!
	var userId : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		goodsId = dictionary["goodsId"] as? Int
		id = dictionary["id"] as? Int
		previewImg = dictionary["previewImg"] as? String
		url = dictionary["url"] as? String
		userId = dictionary["userId"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if goodsId != nil{
			dictionary["goodsId"] = goodsId
		}
		if id != nil{
			dictionary["id"] = id
		}
		if previewImg != nil{
			dictionary["previewImg"] = previewImg
		}
		if url != nil{
			dictionary["url"] = url
		}
		if userId != nil{
			dictionary["userId"] = userId
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         goodsId = aDecoder.decodeObject(forKey: "goodsId") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         previewImg = aDecoder.decodeObject(forKey: "previewImg") as? String
         url = aDecoder.decodeObject(forKey: "url") as? String
         userId = aDecoder.decodeObject(forKey: "userId") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if goodsId != nil{
			aCoder.encode(goodsId, forKey: "goodsId")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if previewImg != nil{
			aCoder.encode(previewImg, forKey: "previewImg")
		}
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}
		if userId != nil{
			aCoder.encode(userId, forKey: "userId")
		}

	}

}