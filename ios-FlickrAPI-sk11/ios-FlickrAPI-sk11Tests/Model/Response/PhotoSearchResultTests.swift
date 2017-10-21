//
//  PhotoSearchResultTests.swift
//  ios-FlickrAPI-sk11Tests
//
//  Created by S.Emoto on 2017/10/21.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import XCTest
@testable import ios_FlickrAPI_sk11

class PhotoSearchResultTests: XCTestCase {
    
    var photosResult: PhotoSearchResult?
    
    override func setUp() {
        super.setUp()
        photosResult = TestDataLoader().fetch()  // テストデータを取得
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPhotosResult() {
        
        let photosResult = self.photosResult
        
        XCTAssertEqual(photosResult?.stat, "ok")
        XCTAssertNotNil(photosResult?.photos)
    }
}

