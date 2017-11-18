//
//  AreaTests.swift
//  ios-GuruNavi-sk12Tests
//
//  Created by S.Emoto on 2017/11/18.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import XCTest
@testable import ios_GuruNavi_sk12

class AreaTests: XCTestCase {
    
    var areasResult: GuruNaviAreaLarge?
    
    override func setUp() {
        super.setUp()
        areasResult = TestAreaDataLoader().fetch()  // テストデータを取得
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testArea() {
        
        let area = self.areasResult?.gareaLarge?.first
        
        XCTAssertEqual(area?.areacodeL, "AREAL5500")
        XCTAssertNotNil(area?.areanameL)  // 暗号化されているためXCTAssertEqual不可
        XCTAssertNotNil(area?.pref)
    }
}

