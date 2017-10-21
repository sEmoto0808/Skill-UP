//
//  PhotoListStatusOfflineTests.swift
//  ios-FlickrAPI-sk11Tests
//
//  Created by S.Emoto on 2017/10/21.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import XCTest
@testable import ios_FlickrAPI_sk11

class PhotoListStatusOfflineTests: XCTestCase {
    
    var photosResult: PhotoSearchResult?
    
    override func setUp() {
        super.setUp()
        photosResult = TestDataLoader().fetch()  // テストデータを取得
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPhotoSearchStatusOffline() {
        
        let viewBase = PhotoListBase()
        viewBase.setStatus(status: PhotosSearchStatus.offline)
        
        XCTAssertEqual(viewBase.numberOfItemsInSection(photos: []), 1)
        XCTAssertEqual(viewBase.message(), "ネットワーク環境の良い環境で再度お試しください。")
        
        let size = viewBase.cellSize()
        let screen = UIScreen.main.bounds
        XCTAssertEqual(size.width, screen.width)
        XCTAssertEqual(size.height, screen.height - 110)
    }
}

