//
//  RestSearchResult.swift
//  ios-GuruNavi-sk12
//
//  Created by S.Emoto on 2017/11/18.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import ObjectMapper

final class RestSearchResult: Mappable {
    var totalHit = ""
    var hitPerPage = ""
    var pageOffset = ""
    var rest:[Rest]?
    
    init?(map: Map){}
    
    func mapping(map: Map) {
        totalHit <- map["total_hit_count"]
        hitPerPage <- map["hit_per_page"]
        pageOffset <- map["page_offset"]
        rest <- map["rest"]
    }
}
