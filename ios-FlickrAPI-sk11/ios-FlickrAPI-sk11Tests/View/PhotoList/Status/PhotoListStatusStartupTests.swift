//
//  PhotoListStatusStartupTests.swift
//  ios-FlickrAPI-sk11Tests
//
//  Created by S.Emoto on 2017/10/21.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import XCTest
@testable import ios_FlickrAPI_sk11

class PhotoListStatusStartupTests: XCTestCase {
    
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
        viewBase.setStatus(status: PhotosSearchStatus.startup)
        
        XCTAssertEqual(viewBase.numberOfItemsInSection(photos: []), 1)
        XCTAssertEqual(viewBase.message(), "写真を検索してみましょう！\nキーワードを入力してください。")
        
        let size = viewBase.cellSize()
        let screen = UIScreen.main.bounds
        XCTAssertEqual(size.width, screen.width)
        XCTAssertEqual(size.height, screen.height - 110)
    }
}

