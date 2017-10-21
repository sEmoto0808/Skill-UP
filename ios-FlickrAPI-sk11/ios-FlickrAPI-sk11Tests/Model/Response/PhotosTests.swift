//
//  PhotosTests.swift
//  ios-FlickrAPI-sk11Tests
//
//  Created by S.Emoto on 2017/10/21.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import XCTest
@testable import ios_FlickrAPI_sk11

class PhotosTests: XCTestCase {
    
    var photosResult: PhotoSearchResult?
    
    override func setUp() {
        super.setUp()
        photosResult = TestDataLoader().fetch()  // テストデータを取得
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPhotos() {
        
        let photos = self.photosResult?.photos
        
        XCTAssertEqual(photos?.page, 1)
        XCTAssertEqual(photos?.pages, 5)
        XCTAssertEqual(photos?.perpage, 100)
        XCTAssertEqual(photos?.photo.count, 98)
        XCTAssertNotNil(photos?.photo.first)
        XCTAssertNotNil(photos?.photo.last)
    }
}

