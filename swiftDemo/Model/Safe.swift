//
//	Safe.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Safe : NSObject, NSCoding{

	var bindPhone : String!
	var gesturepwd : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		bindPhone = dictionary["bindPhone"] as? String
		gesturepwd = dictionary["gesturepwd"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if bindPhone != nil{
			dictionary["bindPhone"] = bindPhone
		}
		if gesturepwd != nil{
			dictionary["gesturepwd"] = gesturepwd
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         bindPhone = aDecoder.decodeObject(forKey: "bindPhone") as? String
         gesturepwd = aDecoder.decodeObject(forKey: "gesturepwd") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if bindPhone != nil{
			aCoder.encode(bindPhone, forKey: "bindPhone")
		}
		if gesturepwd != nil{
			aCoder.encode(gesturepwd, forKey: "gesturepwd")
		}

	}

}