//
//  Prefecture.swift
//  ios-GuruNavi-sk12
//
//  Created by S.Emoto on 2017/11/18.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import ObjectMapper

final class Prefecture: Mappable {
    var prefCode = ""
    var prefName = ""
    
    init?(map: Map){}
    
    func mapping(map: Map) {
        prefCode <- map["pref_code"]
        prefName <- map["pref_name"]
    }
}

