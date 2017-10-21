//
//  PhotoSearchParamsBuilder.swift
//  ios-FlickrAPI-sk11
//
//  Created by S.Emoto on 2017/10/21.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import UIKit

final class PhotoSearchParamsBuilder {
    
    static let perPage = 50
    
    static func create(text: String, page: Int) -> [String: Any]{
        
        var params = FlickrBaseParamsBuilder.create()
        params["page"] = "\(page)"
        params["per_page"] = "\(perPage)"
        params["text"] = text
        return params
    }
}
