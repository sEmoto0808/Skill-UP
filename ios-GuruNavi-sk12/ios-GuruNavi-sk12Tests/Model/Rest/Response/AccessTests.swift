
//
//  AccessTests.swift
//  ios-GuruNavi-sk12Tests
//
//  Created by S.Emoto on 2017/11/18.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import XCTest
@testable import ios_GuruNavi_sk12

class AccessTests: XCTestCase {
    
    var restsResult: RestSearchResult?
    
    override func setUp() {
        super.setUp()
        restsResult = TestRestListDataLoader().fetch()  // テストデータを取得
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAccess() {
        
        let access = self.restsResult?.rest?.first?.access
        
        XCTAssertNotNil(access?.station)  // 暗号化されているためXCTAssertEqual不可
        XCTAssertEqual(access?.walk, "1")
    }
}

