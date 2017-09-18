//
//  Tweet.swift
//  ios-TwitterClient-sk9
//
//  Created by 江本匠 on 2017/08/26.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import ObjectMapper

final class Tweet: Mappable {
    
    var text = ""
    //var user = [User]()
    var name = ""
    var screenName = ""
    var profileImage = ""
    
    init?(map: Map) {}
    
    func mapping(map: Map) {
        text <- map["text"]
        name <- map["user.name"]
        screenName <- map["user.screen_name"]
        profileImage <- map["user.profile_image_url"]
    }
}

//final class User: Mappable {
//    
//    var name = ""
//    var screenName = ""
//    var profileImage = ""
//    
//    init?(map: Map) {}
//    
//    func mapping(map: Map) {
//        name <- map["name"]
//        screenName <- map["screen_name"]
//        profileImage <- map["profile_image_url"]
//    }
//}

