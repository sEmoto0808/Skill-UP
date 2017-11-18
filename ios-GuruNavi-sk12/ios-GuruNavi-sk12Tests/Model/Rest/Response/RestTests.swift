//
//  RestTests.swift
//  ios-GuruNavi-sk12Tests
//
//  Created by S.Emoto on 2017/11/18.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import XCTest
@testable import ios_GuruNavi_sk12

class RestTests: XCTestCase {
    
    var restsResult: RestSearchResult?
    
    override func setUp() {
        super.setUp()
        restsResult = TestRestListDataLoader().fetch()  // テストデータを取得
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRest() {
        
        let rest = self.restsResult?.rest?.first
        
        XCTAssertNotNil(rest?.name)  // 暗号化されているためXCTAssertEqual不可
        XCTAssertNotNil(rest?.imageUrl)  // 暗号化されているためXCTAssertEqual不可
        XCTAssertNotNil(rest?.address)  // 暗号化されているためXCTAssertEqual不可
        XCTAssertEqual(rest?.tel, "050-3491-3432")
        XCTAssertNotNil(rest?.access)
        XCTAssertEqual(rest?.budget, "2980")
    }
}

