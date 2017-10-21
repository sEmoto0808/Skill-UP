//
//  Photos.swift
//  ios-FlickrAPI-sk11
//
//  Created by S.Emoto on 2017/10/21.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import ObjectMapper

final class Photos: Mappable {
    
    var page = 0
    var pages = 0
    var perpage = 0
    var photo = [Photo]()
    
    init?(map: Map){}
    
    func mapping(map: Map) {
        page    <- map["page"]
        pages   <- map["pages"]
        perpage <- map["perpage"]
        photo   <- map["photo"]
    }
}
