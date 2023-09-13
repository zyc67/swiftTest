//
//  HomeListModel.swift
//  swiftDemo
//
//  Created by weather on 2023/8/11.
//

import UIKit
import SwiftyJSON

protocol Model {
    init(jsonData: JSON)
}

class HomeListModel: Model {
    
    // 0日记 1手帐 2精选手帐(只有order_type=1且p=0时才会存在)(2已废弃) 3广告(order_type=1时存在) 100(v7.1.6资源位对象信息)
    var type: Int!
    // type=0时为日记id type=1时为手帐id
    var objId: Int!
    var diary: DiaryModel?
    var scrapSheet: HandModel?
    var advert: AdvertModel?
    var resourceData: ResourceModel?
    
    required init(jsonData: JSON) {
        type = jsonData["type"].intValue
        objId = jsonData["obj_id"].intValue
        diary = DiaryModel(jsonData: jsonData["diary"])
        scrapSheet = HandModel(jsonData: jsonData["scrap_sheet"])
        advert = AdvertModel(jsonData: jsonData["advert"])
        resourceData = ResourceModel(jsonData: jsonData["resourceData"])
    }
}

class DiaryModel: Model {
    var diaryId: Int!
    var userId: Int!
    var user: User!
    var content: String!
    var ifprivate: Int!
    var feel: Int!
    var likeNum: Int!
    var CommentNum: Int!
    var myLike: Int!
    var status: Int!
    var createTime: String!
    var modifyTime: String!
    var likeBase: Int!
    var feelColor: String
    var feelMood: Int!
    var myFavorite: Int!
    var viewNum: Int!
    var weather: Int!
    var address: String!
    var tag: String!
    var audio: String!
    var audioContent: String!
    var translate: Int!
    var translateJson: String!
    var imgs: [ImageModel]?
    
    var analyzeContent: (String, [[String: Any]]?, [[String: Any]]?)
    var translateSrcOne: String?
    var translateDstOne: String?
    var translateSrcTwo: String?
    var translateDstTwo: String?
    
    required init(jsonData: JSON) {
        diaryId = jsonData["diary_id"].intValue
        userId = jsonData["user_id"].intValue
        user = User(jsonData: jsonData["user"])
        content = jsonData["content"].stringValue
        ifprivate = jsonData["ifprivate"].intValue
        feel = jsonData["feel"].intValue
        likeNum = jsonData["like"]["num"].intValue
        CommentNum = jsonData["comment"]["num"].intValue
        myLike = jsonData["my_like"].intValue
        status = jsonData["status"].intValue
        createTime = jsonData["create_time"].stringValue
        modifyTime = jsonData["modify_time"].stringValue
        likeBase = jsonData["like_base"].intValue
        feelColor = jsonData["feelcolor"].stringValue
        feelMood = jsonData["feelmood"].intValue
        myFavorite = jsonData["my_favorite"].intValue
        viewNum = jsonData["view_num"].intValue
        weather = jsonData["weather"].intValue
        address = jsonData["address"].stringValue
        tag = jsonData["tag"].stringValue
        audio = jsonData["audio"].stringValue
        audioContent = jsonData["audioContent"].stringValue
        translate = jsonData["translate"].intValue
        translateJson = jsonData["translate_json"].stringValue
        imgs = jsonData["imgs"].array?.map({ImageModel(jsonData: $0)})
        analyzeContent = content.analyzeContent()
        
        if translate == 1, translateJson.count > 0 {
            let translates = translateJson.stringToJson as! [[String: Any]]
            
            let translateOne = translates[0] as! [String: String]
            translateSrcOne = translateOne["src"]!
            translateDstOne = translateOne["dst"]!
            
            if translates.count > 1 {
                let translateTwo = translates[1] as! [String: String]
                translateSrcTwo = translateTwo["src"]!
                translateDstTwo = translateTwo["dst"]!
            }
        }
    }
}

class HandModel: Model {
    var sheetId: Int!
    var bookId: Int!
    var userId: Int!
    var user: User!
    var name: String!
    var shotcuts: String!
    required init(jsonData: JSON) {
        sheetId = jsonData["sheet_id"].intValue
        bookId = jsonData["book_id"].intValue
        userId = jsonData["user_id"].intValue
        user = User(jsonData: jsonData["user"])
        name = jsonData["name"].stringValue
        shotcuts = jsonData["shotcuts"][0]["img_url"].stringValue
    }
}

class AdvertModel: Model {
    required init(jsonData: JSON) {
        
    }
}

class ResourceModel: Model {
    var resourceCode: Int!
    var resourceName: String!
    var dataList: [Any]?
    required init(jsonData: JSON) {
        // 资源位代码 101文集 102话题推荐 103明星榜 104精选手帐 105热门社团 106新社团 107周榜社团
        resourceCode = jsonData["resourceCode"].intValue
        resourceName = jsonData["resourceName"].stringValue
        dataList = jsonData["dataList"].array?.map({
            if resourceCode == 101 {
                return $0
            } else if resourceCode == 102 {
                return TopicModel(jsonData: $0)
            } else if resourceCode == 104 {
                return ScrapModel(jsonData: $0)
            }
            return $0
        })
    }
}

class ImageModel: Model {
    var id: Int!
    var imgUrl: String!
    var imgSuffix: String!
    required init(jsonData: JSON) {
        id = jsonData["id"].intValue
        imgUrl = jsonData["img_url"].stringValue
        imgSuffix = jsonData["img_suffix"].stringValue
    }
}

class TopicModel: Model {
    var talkId: Int!
    var diaryId: Int!
    var name: String!
    var iconUrl: String!
    required init(jsonData: JSON) {
        talkId = jsonData["talk_id"].intValue
        diaryId = jsonData["diary_id"].intValue
        name = jsonData["name"].stringValue
        iconUrl = jsonData["icon_url"].stringValue
    }
}

class ScrapModel: Model {
    var sheetId: Int!
    var bookId: Int!
    var imgUrl: String!
    var title: String!
    required init(jsonData: JSON) {
        sheetId = jsonData["sheet_id"].intValue
        bookId = jsonData["book_id"].intValue
        imgUrl = jsonData["imgUrl"].stringValue
        title = jsonData["title"].stringValue
    }
}
