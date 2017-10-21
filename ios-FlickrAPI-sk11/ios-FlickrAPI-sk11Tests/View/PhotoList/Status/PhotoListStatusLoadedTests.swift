//
//  PhotoListStatusLoadedTests.swift
//  ios-FlickrAPI-sk11Tests
//
//  Created by S.Emoto on 2017/10/21.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import XCTest
@testable import ios_FlickrAPI_sk11

class PhotoListStatusLoadedTests: XCTestCase {
    
    var photosResult: PhotoSearchResult?
    
    override func setUp() {
        super.setUp()
        photosResult = TestDataLoader().fetch()  // テストデータを取得
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPhotoSearchStatusLoaded() {
        
        if let photosResult = self.photosResult,
            let photo = photosResult.photos?.photo {
            
            let viewBase = PhotoListBase()
            viewBase.setStatus(status: PhotosSearchStatus.loaded(photosResult))
            
            XCTAssertEqual(viewBase.numberOfItemsInSection(photos: photo), 98)
            
            let size = viewBase.cellSize()
            let screen = UIScreen.main.bounds
            XCTAssertEqual(size.width, (screen.width - CGFloat(10)) / CGFloat(2))
            XCTAssertEqual(size.height, (screen.height - 110) / 5)
        }
    }
}
