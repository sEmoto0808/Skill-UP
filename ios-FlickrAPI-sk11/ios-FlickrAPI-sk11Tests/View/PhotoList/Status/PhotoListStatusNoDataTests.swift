//
//  PhotoListStatusNoDataTests.swift
//  ios-FlickrAPI-sk11Tests
//
//  Created by S.Emoto on 2017/10/21.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import XCTest
@testable import ios_FlickrAPI_sk11

class PhotoListStatusNoDataTests: XCTestCase {
    
    var photosResult: PhotoSearchResult?
    
    override func setUp() {
        super.setUp()
        photosResult = TestDataLoader().fetch()  // テストデータを取得
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPhotoSearchStatusNoData() {
        
        let viewBase = PhotoListBase()
        viewBase.setStatus(status: PhotosSearchStatus.noData)
        
        XCTAssertEqual(viewBase.numberOfItemsInSection(photos: []), 1)
        XCTAssertEqual(viewBase.message(), "該当する写真がありません。\n検索ワードを変更してお試しください。")
        
        let size = viewBase.cellSize()
        let screen = UIScreen.main.bounds
        XCTAssertEqual(size.width, screen.width)
        XCTAssertEqual(size.height, screen.height - 110)
    }
}

