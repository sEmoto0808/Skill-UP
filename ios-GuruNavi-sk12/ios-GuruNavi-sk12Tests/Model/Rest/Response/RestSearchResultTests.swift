
//
//  RestSearchResultTests.swift
//  ios-GuruNavi-sk12Tests
//
//  Created by S.Emoto on 2017/11/18.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import XCTest
@testable import ios_GuruNavi_sk12

class RestSearchResultTests: XCTestCase {
    
    var restsResult: RestSearchResult?
    
    override func setUp() {
        super.setUp()
        restsResult = TestRestListDataLoader().fetch()  // テストデータを取得
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRestSearchResult() {
        
        let restsResult = self.restsResult
        
        XCTAssertNotNil(restsResult?.totalHit)
        XCTAssertEqual(restsResult?.hitPerPage, "10")
        XCTAssertTrue(Int((restsResult?.pageOffset)!)! >= 1)
        XCTAssertNotNil(restsResult?.rest)
    }
}

