//
//  SongInfo.swift
//  ios-iTunesSearch-sk10
//
//  Created by S.Emoto on 2017/09/23.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import Foundation
import RealmSwift

final class SongInfo: Object {
    
    dynamic var songId = ""
    dynamic var iconImage: Data?
    
    override static func primaryKey() -> String? {
        return "songId"
    }
}
