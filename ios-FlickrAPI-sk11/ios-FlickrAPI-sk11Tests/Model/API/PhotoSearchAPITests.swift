//
//  PhotoSearchAPITests.swift
//  ios-FlickrAPI-sk11Tests
//
//  Created by S.Emoto on 2017/10/21.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import XCTest
@testable import ios_FlickrAPI_sk11

class PhotoSearchAPITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPhotoSearchRequestCount() {
        
        let api = PhotoSearchAPI()
        XCTAssertEqual(api.current(), 1)  // 初回リクエスト時 requestCount = 1
        
        for _ in 0..<2 {
            api.increment()
        }
        XCTAssertEqual(api.current(), 3)  // increment ２回 requestCount = 3
        
        api.reset()
        XCTAssertEqual(api.current(), 1)  // リセット時 requestCount = 1
        
        api.updateTotal(total: 150)
        XCTAssertTrue(api.isMoreRequest())     // requestCount = 1 * perPage = 50 < totalCount = 150　○
        
        api.increment()
        XCTAssertTrue(api.isMoreRequest())     // requestCount = 2 * perPage = 50 < totalCount = 150　○
        
        api.increment()
        XCTAssertFalse(api.isMoreRequest())    // requestCount = 3 * perPage = 50 < totalCount = 150　Ｘ
    }
}

