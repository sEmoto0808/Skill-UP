//
//  AreaDataLoaderTests.swift
//  ios-GuruNavi-sk12Tests
//
//  Created by S.Emoto on 2017/11/18.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import XCTest
@testable import ios_GuruNavi_sk12

class AreaDataLoaderTests: XCTestCase {

    let areaDataLoader = AreaDataLoader()
    let loadable = TestAreaDataLoadable()
    
    override func setUp() {
        super.setUp()
        areaDataLoader.loadable = loadable
    }
    
    override func tearDown() {
        super.tearDown()
        areaDataLoader.loadable = nil
    }
    
    /// 東京都の一覧を取得する
    /// check : prefName = 東京都
    func testFilterTokyo() {
        
        let exp = expectation(description: "東京都の一覧を検索するときのテスト")
        loadable.asyncExpectation = exp
        areaDataLoader.findArea(prefName: "東京都")
        
        waitForExpectations(timeout: 1) { error in
            if let error = error {
                XCTFail("waitForExpectationsエラー: \(error)")
            }
            
            XCTAssertTrue(self.loadable.areas.count > 0)
            XCTAssertEqual(self.loadable.areas.first?.pref?.prefName, "東京都")
        }
    }
}
