//
//  AreaListProviderTests.swift
//  ios-GuruNavi-sk12Tests
//
//  Created by S.Emoto on 2017/11/18.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import XCTest
@testable import ios_GuruNavi_sk12

class AreaListProviderTests: XCTestCase {
    
    var areasResult: GuruNaviAreaLarge?
    
    override func setUp() {
        super.setUp()
        areasResult = TestAreaDataLoader().fetch()  // テストデータを取得
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSetAreaList() {
        
        if let areasResult = self.areasResult,
            let areas = areasResult.gareaLarge {
            
            let provider = AreaListProvider()
            provider.set(areaList: areas)
            
            XCTAssertEqual(provider.areaList.count, 437)
        }
    }
}

