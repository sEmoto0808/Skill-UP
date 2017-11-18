//
//  Access.swift
//  ios-GuruNavi-sk12
//
//  Created by S.Emoto on 2017/11/18.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import ObjectMapper

final class Access: Mappable {
    var station = ""
    var walk = ""
    
    init?(map: Map){}
    
    func mapping(map: Map) {
        station    <- map["station"]
        walk       <- map["walk"]
    }
}
