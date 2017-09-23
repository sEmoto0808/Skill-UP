//
//  DummyResponse.swift
//  ios-iTunesSearch-sk10
//
//  Created by S.Emoto on 2017/09/23.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import Foundation

final class DummyResponse {
    
    static let songlist: [String : Any] = [
        "resultCount": 1,
        "results": [
            ["artistName": "Beatles",
             "trackName": "let it be",
             "trackId": "123456789",
             "artworkUrl100": "http://a1.itunes.apple.com/r10/Music/3b/6a/33/mzi.qzdqwsel.100x100-75.jpg"]
        ]
    ]
}

