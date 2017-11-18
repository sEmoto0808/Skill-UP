//
//  RestSearchParamsBuilder.swift
//  ios-GuruNavi-sk12
//
//  Created by S.Emoto on 2017/11/18.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import UIKit

final class RestSearchParamsBuilder {
    
    static let perPage = 50
    
    static func create(areaCode: String, offset: Int = 1) -> [String: Any]{
        
        let params = [
            "keyid": "d142c25896788664c57fbe9ff50dc835",
            "areacode_l": areaCode,
            "format": "json",
            "hit_per_page": "\(perPage)",
            "offset_page": "\(offset)"
        ]
        
        return params
    }
}
