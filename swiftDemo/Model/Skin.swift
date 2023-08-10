//
//	Skin.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Skin : NSObject, NSCoding{

	var createTime : String!
	var id : Int!
	var modifyTime : String!
	var skinType : Int!
	var url : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		createTime = dictionary["createTime"] as? String
		id = dictionary["id"] as? Int
		modifyTime = dictionary["modifyTime"] as? String
		skinType = dictionary["skinType"] as? Int
		url = dictionary["url"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if createTime != nil{
			dictionary["createTime"] = createTime
		}
		if id != nil{
			dictionary["id"] = id
		}
		if modifyTime != nil{
			dictionary["modifyTime"] = modifyTime
		}
		if skinType != nil{
			dictionary["skinType"] = skinType
		}
		if url != nil{
			dictionary["url"] = url
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         createTime = aDecoder.decodeObject(forKey: "createTime") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         modifyTime = aDecoder.decodeObject(forKey: "modifyTime") as? String
         skinType = aDecoder.decodeObject(forKey: "skinType") as? Int
         url = aDecoder.decodeObject(forKey: "url") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if createTime != nil{
			aCoder.encode(createTime, forKey: "createTime")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if modifyTime != nil{
			aCoder.encode(modifyTime, forKey: "modifyTime")
		}
		if skinType != nil{
			aCoder.encode(skinType, forKey: "skinType")
		}
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}

	}

}