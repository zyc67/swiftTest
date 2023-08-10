//
//	BindingInfo.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class BindingInfo : NSObject, NSCoding{

	var hwbinding : Bool!
	var hwnickname : String!
	var qqbinding : Bool!
	var qqnickname : String!
	var wxbinding : Bool!
	var wxnickname : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		hwbinding = dictionary["hwbinding"] as? Bool
		hwnickname = dictionary["hwnickname"] as? String
		qqbinding = dictionary["qqbinding"] as? Bool
		qqnickname = dictionary["qqnickname"] as? String
		wxbinding = dictionary["wxbinding"] as? Bool
		wxnickname = dictionary["wxnickname"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if hwbinding != nil{
			dictionary["hwbinding"] = hwbinding
		}
		if hwnickname != nil{
			dictionary["hwnickname"] = hwnickname
		}
		if qqbinding != nil{
			dictionary["qqbinding"] = qqbinding
		}
		if qqnickname != nil{
			dictionary["qqnickname"] = qqnickname
		}
		if wxbinding != nil{
			dictionary["wxbinding"] = wxbinding
		}
		if wxnickname != nil{
			dictionary["wxnickname"] = wxnickname
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         hwbinding = aDecoder.decodeObject(forKey: "hwbinding") as? Bool
         hwnickname = aDecoder.decodeObject(forKey: "hwnickname") as? String
         qqbinding = aDecoder.decodeObject(forKey: "qqbinding") as? Bool
         qqnickname = aDecoder.decodeObject(forKey: "qqnickname") as? String
         wxbinding = aDecoder.decodeObject(forKey: "wxbinding") as? Bool
         wxnickname = aDecoder.decodeObject(forKey: "wxnickname") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if hwbinding != nil{
			aCoder.encode(hwbinding, forKey: "hwbinding")
		}
		if hwnickname != nil{
			aCoder.encode(hwnickname, forKey: "hwnickname")
		}
		if qqbinding != nil{
			aCoder.encode(qqbinding, forKey: "qqbinding")
		}
		if qqnickname != nil{
			aCoder.encode(qqnickname, forKey: "qqnickname")
		}
		if wxbinding != nil{
			aCoder.encode(wxbinding, forKey: "wxbinding")
		}
		if wxnickname != nil{
			aCoder.encode(wxnickname, forKey: "wxnickname")
		}

	}

}