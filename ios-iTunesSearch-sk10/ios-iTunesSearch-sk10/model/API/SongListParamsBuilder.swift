//
//  SongListParamsBuilder.swift
//  ios-iTunesSearch-sk10
//
//  Created by S.Emoto on 2017/09/23.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import Foundation

final class SongListParamsBuilder {
    
    static func create(keyword: String) -> [String: String] {
        
        var params = [String: String]()
        
        params["keyword"] = keyword
        
        return params
    }
}
