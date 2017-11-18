//
//  GuruNaviAreaLarge.swift
//  ios-GuruNavi-sk12
//
//  Created by S.Emoto on 2017/11/18.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import ObjectMapper

final class GuruNaviAreaLarge: Mappable {
    var gareaLarge: [Area]?
    
    init?(map: Map){}
    
    func mapping(map: Map) {
        gareaLarge <- map["garea_large"]
    }
}
