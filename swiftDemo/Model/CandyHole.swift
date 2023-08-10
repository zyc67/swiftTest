//
//	CandyHole.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CandyHole : NSObject, NSCoding{

	var endTime : String!
	var holeId : Int!
	var nowTime : String!
	var num : Int!
	var startTime : String!
	var status : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		endTime = dictionary["endTime"] as? String
		holeId = dictionary["holeId"] as? Int
		nowTime = dictionary["nowTime"] as? String
		num = dictionary["num"] as? Int
		startTime = dictionary["startTime"] as? String
		status = dictionary["status"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if endTime != nil{
			dictionary["endTime"] = endTime
		}
		if holeId != nil{
			dictionary["holeId"] = holeId
		}
		if nowTime != nil{
			dictionary["nowTime"] = nowTime
		}
		if num != nil{
			dictionary["num"] = num
		}
		if startTime != nil{
			dictionary["startTime"] = startTime
		}
		if status != nil{
			dictionary["status"] = status
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         endTime = aDecoder.decodeObject(forKey: "endTime") as? String
         holeId = aDecoder.decodeObject(forKey: "holeId") as? Int
         nowTime = aDecoder.decodeObject(forKey: "nowTime") as? String
         num = aDecoder.decodeObject(forKey: "num") as? Int
         startTime = aDecoder.decodeObject(forKey: "startTime") as? String
         status = aDecoder.decodeObject(forKey: "status") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if endTime != nil{
			aCoder.encode(endTime, forKey: "endTime")
		}
		if holeId != nil{
			aCoder.encode(holeId, forKey: "holeId")
		}
		if nowTime != nil{
			aCoder.encode(nowTime, forKey: "nowTime")
		}
		if num != nil{
			aCoder.encode(num, forKey: "num")
		}
		if startTime != nil{
			aCoder.encode(startTime, forKey: "startTime")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}

	}

}