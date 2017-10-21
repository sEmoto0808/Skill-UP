//
//  PhotoImageURLBuilderTests.swift
//  ios-FlickrAPI-sk11Tests
//
//  Created by S.Emoto on 2017/10/21.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import XCTest
@testable import ios_FlickrAPI_sk11

class PhotoImageURLBuilderTests: XCTestCase {
    
    var photosResult: PhotoSearchResult?
    
    override func setUp() {
        super.setUp()
        photosResult = TestDataLoader().fetch()  // テストデータを取得
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPhotoImageURLBuilder() {
        
        let photo = self.photosResult?.photos?.photo.first  // １枚目の写真でテスト
        
        XCTAssertEqual(PhotoImageURLBuilder.create(photo: photo!),
                       "https://farm5.staticflickr.com/4469/37525622840_3f0c188267.jpg")
    }
}
