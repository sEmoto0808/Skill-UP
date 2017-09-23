//
//  Song.swift
//  ios-iTunesSearch-sk10
//
//  Created by S.Emoto on 2017/09/23.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import ObjectMapper

final class Song: Mappable {
    
    var artistName = ""
    var trackName = ""
    var trackId = ""
    var iconImage = ""
    
    init?(map: Map) {}
    
    func mapping(map: Map) {
        
        artistName <- map["artistName"]
        trackName <- map["trackName"]
        trackId <- map["trackId"]
        iconImage <- map["artworkUrl100"]
    }
}
