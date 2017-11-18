//
//  PrefectureTests.swift
//  ios-GuruNavi-sk12Tests
//
//  Created by S.Emoto on 2017/11/18.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import XCTest
@testable import ios_GuruNavi_sk12

class PrefectureTests: XCTestCase {
    
    var areasResult: GuruNaviAreaLarge?
    
    override func setUp() {
        super.setUp()
        areasResult = TestAreaDataLoader().fetch()  // テストデータを取得
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPrefecture() {
        
        let pref = self.areasResult?.gareaLarge?.first?.pref
        
        XCTAssertEqual(pref?.prefCode, "PREF01")
        XCTAssertNotNil(pref?.prefName)  // 暗号化されているためXCTAssertEqual不可
    }
}

