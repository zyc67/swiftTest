//
//	Club.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Club : NSObject, NSCoding{

	var clubId : Int!
	var clubName : String!
	var declaration : String!
	var icon : String!
	var imClub : ImClub!
	var notice : String!
	var opadminId : Int!
	var userId : Int!
	var versionLvl : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		clubId = dictionary["clubId"] as? Int
		clubName = dictionary["clubName"] as? String
		declaration = dictionary["declaration"] as? String
		icon = dictionary["icon"] as? String
		if let imClubData = dictionary["imClub"] as? [String:Any]{
			imClub = ImClub(fromDictionary: imClubData)
		}
		notice = dictionary["notice"] as? String
		opadminId = dictionary["opadminId"] as? Int
		userId = dictionary["userId"] as? Int
		versionLvl = dictionary["versionLvl"] as? Int
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
		if clubName != nil{
			dictionary["clubName"] = clubName
		}
		if declaration != nil{
			dictionary["declaration"] = declaration
		}
		if icon != nil{
			dictionary["icon"] = icon
		}
		if imClub != nil{
			dictionary["imClub"] = imClub.toDictionary()
		}
		if notice != nil{
			dictionary["notice"] = notice
		}
		if opadminId != nil{
			dictionary["opadminId"] = opadminId
		}
		if userId != nil{
			dictionary["userId"] = userId
		}
		if versionLvl != nil{
			dictionary["versionLvl"] = versionLvl
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
         clubName = aDecoder.decodeObject(forKey: "clubName") as? String
         declaration = aDecoder.decodeObject(forKey: "declaration") as? String
         icon = aDecoder.decodeObject(forKey: "icon") as? String
         imClub = aDecoder.decodeObject(forKey: "imClub") as? ImClub
         notice = aDecoder.decodeObject(forKey: "notice") as? String
         opadminId = aDecoder.decodeObject(forKey: "opadminId") as? Int
         userId = aDecoder.decodeObject(forKey: "userId") as? Int
         versionLvl = aDecoder.decodeObject(forKey: "versionLvl") as? Int

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
		if clubName != nil{
			aCoder.encode(clubName, forKey: "clubName")
		}
		if declaration != nil{
			aCoder.encode(declaration, forKey: "declaration")
		}
		if icon != nil{
			aCoder.encode(icon, forKey: "icon")
		}
		if imClub != nil{
			aCoder.encode(imClub, forKey: "imClub")
		}
		if notice != nil{
			aCoder.encode(notice, forKey: "notice")
		}
		if opadminId != nil{
			aCoder.encode(opadminId, forKey: "opadminId")
		}
		if userId != nil{
			aCoder.encode(userId, forKey: "userId")
		}
		if versionLvl != nil{
			aCoder.encode(versionLvl, forKey: "versionLvl")
		}

	}

}