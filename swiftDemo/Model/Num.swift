//
//	Num.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Num : NSObject, NSCoding{

	var allDiaryNum : Int!
	var diaryNum : Int!
	var focusEoNum : Int!
	var focusMe : Int!
	var focusNum : Int!
	var likeNum : Int!
	var myFocus : Int!
	var myLike : Int!
	var sheetNum : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		allDiaryNum = dictionary["allDiaryNum"] as? Int
		diaryNum = dictionary["diaryNum"] as? Int
		focusEoNum = dictionary["focusEoNum"] as? Int
		focusMe = dictionary["focusMe"] as? Int
		focusNum = dictionary["focusNum"] as? Int
		likeNum = dictionary["likeNum"] as? Int
		myFocus = dictionary["myFocus"] as? Int
		myLike = dictionary["myLike"] as? Int
		sheetNum = dictionary["sheetNum"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if allDiaryNum != nil{
			dictionary["allDiaryNum"] = allDiaryNum
		}
		if diaryNum != nil{
			dictionary["diaryNum"] = diaryNum
		}
		if focusEoNum != nil{
			dictionary["focusEoNum"] = focusEoNum
		}
		if focusMe != nil{
			dictionary["focusMe"] = focusMe
		}
		if focusNum != nil{
			dictionary["focusNum"] = focusNum
		}
		if likeNum != nil{
			dictionary["likeNum"] = likeNum
		}
		if myFocus != nil{
			dictionary["myFocus"] = myFocus
		}
		if myLike != nil{
			dictionary["myLike"] = myLike
		}
		if sheetNum != nil{
			dictionary["sheetNum"] = sheetNum
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         allDiaryNum = aDecoder.decodeObject(forKey: "allDiaryNum") as? Int
         diaryNum = aDecoder.decodeObject(forKey: "diaryNum") as? Int
         focusEoNum = aDecoder.decodeObject(forKey: "focusEoNum") as? Int
         focusMe = aDecoder.decodeObject(forKey: "focusMe") as? Int
         focusNum = aDecoder.decodeObject(forKey: "focusNum") as? Int
         likeNum = aDecoder.decodeObject(forKey: "likeNum") as? Int
         myFocus = aDecoder.decodeObject(forKey: "myFocus") as? Int
         myLike = aDecoder.decodeObject(forKey: "myLike") as? Int
         sheetNum = aDecoder.decodeObject(forKey: "sheetNum") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if allDiaryNum != nil{
			aCoder.encode(allDiaryNum, forKey: "allDiaryNum")
		}
		if diaryNum != nil{
			aCoder.encode(diaryNum, forKey: "diaryNum")
		}
		if focusEoNum != nil{
			aCoder.encode(focusEoNum, forKey: "focusEoNum")
		}
		if focusMe != nil{
			aCoder.encode(focusMe, forKey: "focusMe")
		}
		if focusNum != nil{
			aCoder.encode(focusNum, forKey: "focusNum")
		}
		if likeNum != nil{
			aCoder.encode(likeNum, forKey: "likeNum")
		}
		if myFocus != nil{
			aCoder.encode(myFocus, forKey: "myFocus")
		}
		if myLike != nil{
			aCoder.encode(myLike, forKey: "myLike")
		}
		if sheetNum != nil{
			aCoder.encode(sheetNum, forKey: "sheetNum")
		}

	}

}