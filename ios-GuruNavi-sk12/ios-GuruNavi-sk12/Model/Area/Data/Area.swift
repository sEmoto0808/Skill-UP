//
//  Area.swift
//  ios-GuruNavi-sk12
//
//  Created by S.Emoto on 2017/11/18.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import ObjectMapper

final class Area: Mappable {
    var areacodeL = ""
    var areanameL = ""
    var pref: Prefecture?
    
    init?(map: Map){}
    
    func mapping(map: Map) {
        areacodeL <- map["areacode_l"]
        areanameL <- map["areaname_l"]
        pref <- map["pref"]
    }
}

