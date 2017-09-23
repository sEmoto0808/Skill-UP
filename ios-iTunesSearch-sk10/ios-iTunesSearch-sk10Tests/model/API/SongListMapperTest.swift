//
//  SongListMapperTest.swift
//  ios-iTunesSearch-sk10
//
//  Created by S.Emoto on 2017/09/23.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import XCTest
import ObjectMapper
@testable import ios_iTunesSearch_sk10

class SongListMapperTest: XCTestCase {

    func testMapping() {
        
        // Exercise
        let song = Mapper<Response>().map(JSON: DummyResponse.songlist)
        
        // Verify
        XCTAssertEqual(song?.results[0].artistName, "Beatles")
        XCTAssertEqual(song?.results[0].trackName, "let it be")
        XCTAssertEqual(song?.results[0].trackId, "123456789")
        XCTAssertEqual(song?.results[0].iconImage, "http://a1.itunes.apple.com/r10/Music/3b/6a/33/mzi.qzdqwsel.100x100-75.jpg")
    }
}
