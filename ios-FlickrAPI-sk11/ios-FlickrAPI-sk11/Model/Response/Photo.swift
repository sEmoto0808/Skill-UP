//
//  Photo.swift
//  ios-FlickrAPI-sk11
//
//  Created by S.Emoto on 2017/10/21.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import ObjectMapper

final class Photo: Mappable {
    var farm = 0
    var server = ""
    var id = ""
    var secret = ""
    
    init?(map: Map){}
    
    func mapping(map: Map) {
        farm    <- map["farm"]
        server  <- map["server"]
        id      <- map["id"]
        secret  <- map["secret"]
    }
}
