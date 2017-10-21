//
//  PhotoImageURLBuilder.swift
//  ios-FlickrAPI-sk11
//
//  Created by S.Emoto on 2017/10/21.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import Foundation

final class PhotoImageURLBuilder {
    
    static func create(photo: Photo) -> String{
        return "https://farm\(photo.farm).staticflickr.com/\(photo.server)/\(photo.id)_\(photo.secret).jpg"
    }
}
