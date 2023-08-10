//
//	Gold.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Gold : NSObject, NSCoding{

	var goldConfig : AnyObject!
	var status : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		goldConfig = dictionary["goldConfig"] as? AnyObject
		status = dictionary["status"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if goldConfig != nil{
			dictionary["goldConfig"] = goldConfig
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
         goldConfig = aDecoder.decodeObject(forKey: "goldConfig") as? AnyObject
         status = aDecoder.decodeObject(forKey: "status") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if goldConfig != nil{
			aCoder.encode(goldConfig, forKey: "goldConfig")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}

	}

}