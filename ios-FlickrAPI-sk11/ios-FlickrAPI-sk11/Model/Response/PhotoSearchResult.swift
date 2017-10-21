//
//  PhotoSearchResult.swift
//  ios-FlickrAPI-sk11
//
//  Created by S.Emoto on 2017/10/21.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import ObjectMapper

final class PhotoSearchResult: Mappable {
    
    var stat = ""
    var photos: Photos?
    
    init?(map: Map) {}
    
    func mapping(map: Map) {
        stat <- map["stat"]
        photos <- map["photos"]
    }
}
