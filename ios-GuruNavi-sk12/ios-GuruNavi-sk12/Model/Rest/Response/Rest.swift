//
//  Rest.swift
//  ios-GuruNavi-sk12
//
//  Created by S.Emoto on 2017/11/18.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import ObjectMapper

final class Rest: Mappable {
    var name = ""
    var imageUrl = ""
    var address = ""
    var tel = ""
    var access:Access?
    var budget = ""
    
    init?(map: Map){}
    
    func mapping(map: Map) {
        name         <- map["name"]
        imageUrl     <- map["image_url.shop_image1"]
        address      <- map["address"]
        tel          <- map["tel"]
        access       <- map["access"]
        budget       <- map["budget"]
    }
}


