//
//  SongInfoTest.swift
//  ios-iTunesSearch-sk10
//
//  Created by S.Emoto on 2017/09/23.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import XCTest
@testable import ios_iTunesSearch_sk10

class SongInfoTest: XCTestCase {

    func testInit() {
        let songInfo = SongInfo()
        
        XCTAssertEqual(songInfo.songId, "")
        XCTAssertEqual(songInfo.iconImage, nil)
    }
    
    func testPrimaryKey() {
        XCTAssertEqual(SongInfo.primaryKey(), "songId")
    }
}
