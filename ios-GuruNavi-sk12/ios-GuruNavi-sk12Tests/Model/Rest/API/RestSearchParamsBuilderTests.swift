//
//  RestSearchParamsBuilderTests.swift
//  ios-GuruNavi-sk12Tests
//
//  Created by S.Emoto on 2017/11/18.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import XCTest
@testable import ios_GuruNavi_sk12

class RestSearchParamsBuilderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    /// ページングの件数を確認する
    /// check : perPage = 50
    func testPerPage() {
        XCTAssertEqual(RestSearchParamsBuilder.perPage, 50)
    }
    
    /// リクエストパラメタを確認する
    /// check : areaCode = TestAreaCode
    func testParamsAreaCode() {
        
        let builder = RestSearchParamsBuilder.create(areaCode: "TestAreaCode")
        
        XCTAssertEqual(builder["areacode_l"] as! String, "TestAreaCode")
        XCTAssertEqual(builder["offset_page"] as! String, "1")
        XCTAssertEqual(builder["hit_per_page"] as! String, "50")
        XCTAssertEqual(builder["format"] as! String, "json")
    }
    
    /// リクエストパラメタを確認する
    /// check : areaCode = TestAreaCode
    /// check : offset = 10
    func testParamsAreaCode1234AndOffsetPage2() {
        
        let builder = RestSearchParamsBuilder.create(areaCode: "TestAreaCode",
                                                     offset: 10)
        
        XCTAssertEqual(builder["areacode_l"] as! String, "TestAreaCode")
        XCTAssertEqual(builder["offset_page"] as! String, "10")
        XCTAssertEqual(builder["hit_per_page"] as! String, "50")
        XCTAssertEqual(builder["format"] as! String, "json")
    }
}

