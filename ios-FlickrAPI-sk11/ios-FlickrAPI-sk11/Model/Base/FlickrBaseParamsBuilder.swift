//
//  FlickrBaseParamsBuilder.swift
//  ios-FlickrAPI-sk11
//
//  Created by S.Emoto on 2017/10/21.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import Foundation

final class FlickrBaseParamsBuilder {
    
    static func create() -> [String: Any] {
        
        return [
            "method" : "flickr.photos.search",
            "api_key" : "92f3fd8101d1d3a3613339d37c0452b9",
            "nojsoncallback" : "1",
            "format": "json"]
    }
}
