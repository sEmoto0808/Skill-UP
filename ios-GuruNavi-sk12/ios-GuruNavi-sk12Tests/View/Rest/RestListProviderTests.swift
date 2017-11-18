
//
//  RestListProviderTests.swift
//  ios-GuruNavi-sk12Tests
//
//  Created by S.Emoto on 2017/11/18.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import XCTest
@testable import ios_GuruNavi_sk12

class RestListProviderTests: XCTestCase {
    
    var restsResult: RestSearchResult?
    
    override func setUp() {
        super.setUp()
        restsResult = TestRestListDataLoader().fetch()  // テストデータを取得
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSetRestList() {
        
        if let restsResult = self.restsResult,
            let rests = restsResult.rest {
            
            let provider = RestListProvider()
            provider.set(restList: rests)
            
            XCTAssertEqual(provider.restList.count, 10)
        }
    }
}

