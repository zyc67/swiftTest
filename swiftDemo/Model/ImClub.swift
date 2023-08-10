//
//	ImClub.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ImClub : NSObject, NSCoding{

	var clubId : Int!
	var groupId : Int!
	var groupIdStr : String!
	var groupName : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		clubId = dictionary["clubId"] as? Int
		groupId = dictionary["groupId"] as? Int
		groupIdStr = dictionary["groupIdStr"] as? String
		groupName = dictionary["groupName"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if clubId != nil{
			dictionary["clubId"] = clubId
		}
		if groupId != nil{
			dictionary["groupId"] = groupId
		}
		if groupIdStr != nil{
			dictionary["groupIdStr"] = groupIdStr
		}
		if groupName != nil{
			dictionary["groupName"] = groupName
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         clubId = aDecoder.decodeObject(forKey: "clubId") as? Int
         groupId = aDecoder.decodeObject(forKey: "groupId") as? Int
         groupIdStr = aDecoder.decodeObject(forKey: "groupIdStr") as? String
         groupName = aDecoder.decodeObject(forKey: "groupName") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if clubId != nil{
			aCoder.encode(clubId, forKey: "clubId")
		}
		if groupId != nil{
			aCoder.encode(groupId, forKey: "groupId")
		}
		if groupIdStr != nil{
			aCoder.encode(groupIdStr, forKey: "groupIdStr")
		}
		if groupName != nil{
			aCoder.encode(groupName, forKey: "groupName")
		}

	}

}