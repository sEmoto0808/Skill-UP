//
//  Response.swift
//  ios-iTunesSearch-sk10
//
//  Created by S.Emoto on 2017/09/23.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import ObjectMapper

final class Response: Mappable {
    
    var resultCount = 0
    var results = [Song]()
    
    init?(map: Map) {}
    
    func mapping(map: Map) {
        
        resultCount <- map["resultCount"]
        results <- map["results"]
    }
}
