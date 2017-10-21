//
//  PhotoTests.swift
//  ios-FlickrAPI-sk11Tests
//
//  Created by S.Emoto on 2017/10/21.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import XCTest
@testable import ios_FlickrAPI_sk11

class PhotoTests: XCTestCase {
    
    var photosResult: PhotoSearchResult?
    
    override func setUp() {
        super.setUp()
        photosResult = TestDataLoader().fetch()  // テストデータを取得
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPhoto() {
        
        let photo = self.photosResult?.photos?.photo.first  // １枚目の写真でテスト
        
        XCTAssertEqual(photo?.farm, 5)
        XCTAssertEqual(photo?.server, "4469")
        XCTAssertEqual(photo?.id, "37525622840")
        XCTAssertEqual(photo?.secret, "3f0c188267")
    }
}

