//
//	RankList.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class RankList : NSObject, NSCoding{

	var buys : Int!
	var fans : Int!
	var growup : Int!
	var invite : Int!
	var name : String!
	var rank : Int!
	var rankBase : Int!
	var srank : Int!
	var suffixRank : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		buys = dictionary["buys"] as? Int
		fans = dictionary["fans"] as? Int
		growup = dictionary["growup"] as? Int
		invite = dictionary["invite"] as? Int
		name = dictionary["name"] as? String
		rank = dictionary["rank"] as? Int
		rankBase = dictionary["rankBase"] as? Int
		srank = dictionary["srank"] as? Int
		suffixRank = dictionary["suffixRank"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if buys != nil{
			dictionary["buys"] = buys
		}
		if fans != nil{
			dictionary["fans"] = fans
		}
		if growup != nil{
			dictionary["growup"] = growup
		}
		if invite != nil{
			dictionary["invite"] = invite
		}
		if name != nil{
			dictionary["name"] = name
		}
		if rank != nil{
			dictionary["rank"] = rank
		}
		if rankBase != nil{
			dictionary["rankBase"] = rankBase
		}
		if srank != nil{
			dictionary["srank"] = srank
		}
		if suffixRank != nil{
			dictionary["suffixRank"] = suffixRank
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         buys = aDecoder.decodeObject(forKey: "buys") as? Int
         fans = aDecoder.decodeObject(forKey: "fans") as? Int
         growup = aDecoder.decodeObject(forKey: "growup") as? Int
         invite = aDecoder.decodeObject(forKey: "invite") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String
         rank = aDecoder.decodeObject(forKey: "rank") as? Int
         rankBase = aDecoder.decodeObject(forKey: "rankBase") as? Int
         srank = aDecoder.decodeObject(forKey: "srank") as? Int
         suffixRank = aDecoder.decodeObject(forKey: "suffixRank") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if buys != nil{
			aCoder.encode(buys, forKey: "buys")
		}
		if fans != nil{
			aCoder.encode(fans, forKey: "fans")
		}
		if growup != nil{
			aCoder.encode(growup, forKey: "growup")
		}
		if invite != nil{
			aCoder.encode(invite, forKey: "invite")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if rank != nil{
			aCoder.encode(rank, forKey: "rank")
		}
		if rankBase != nil{
			aCoder.encode(rankBase, forKey: "rankBase")
		}
		if srank != nil{
			aCoder.encode(srank, forKey: "srank")
		}
		if suffixRank != nil{
			aCoder.encode(suffixRank, forKey: "suffixRank")
		}

	}

}