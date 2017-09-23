//
//  SongInfoDaoTest.swift
//  ios-iTunesSearch-sk10
//
//  Created by S.Emoto on 2017/09/23.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import XCTest
@testable import ios_iTunesSearch_sk10

class SongInfoDaoTest: XCTestCase {
    
    override func setUp() {
        
        super.setUp()
        UTRealm.removeUTDirectory()
    }
    
    override func tearDown() {
        
        UTRealm.removeUTDirectory()
        super.tearDown()
    }
    
    /// アイコン画像を登録する処理と取得する処理のテスト
    func testAddAndFind() {
        
        SongInfoDao().add(model: dummyModel())
        let addedModel = SongInfoDao().findBy(id: "123456789")
        
        XCTAssertNotNil(addedModel)
        XCTAssertEqual(addedModel?.songId, "123456789")
        XCTAssertEqual(addedModel?.iconImage, Data())
    }
    
    // MARK: - private methods
    
    /// 曲のIconImageのダミー
    private func dummyModel() -> SongInfo {
        let model = SongInfo()
        model.songId = "123456789"
        model.iconImage = Data()
        
        return model
    }

}
