//
//	Candy.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Candy : NSObject, NSCoding{

	var adType : Int!
	var balance : Int!
	var candySteal : Int!
	var collectNum : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		adType = dictionary["adType"] as? Int
		balance = dictionary["balance"] as? Int
		candySteal = dictionary["candySteal"] as? Int
		collectNum = dictionary["collectNum"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if adType != nil{
			dictionary["adType"] = adType
		}
		if balance != nil{
			dictionary["balance"] = balance
		}
		if candySteal != nil{
			dictionary["candySteal"] = candySteal
		}
		if collectNum != nil{
			dictionary["collectNum"] = collectNum
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         adType = aDecoder.decodeObject(forKey: "adType") as? Int
         balance = aDecoder.decodeObject(forKey: "balance") as? Int
         candySteal = aDecoder.decodeObject(forKey: "candySteal") as? Int
         collectNum = aDecoder.decodeObject(forKey: "collectNum") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if adType != nil{
			aCoder.encode(adType, forKey: "adType")
		}
		if balance != nil{
			aCoder.encode(balance, forKey: "balance")
		}
		if candySteal != nil{
			aCoder.encode(candySteal, forKey: "candySteal")
		}
		if collectNum != nil{
			aCoder.encode(collectNum, forKey: "collectNum")
		}

	}

}