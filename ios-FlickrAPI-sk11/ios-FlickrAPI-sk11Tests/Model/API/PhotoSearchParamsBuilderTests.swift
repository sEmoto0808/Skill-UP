//
//  PhotoSearchParamsBuilderTests.swift
//  ios-FlickrAPI-sk11Tests
//
//  Created by S.Emoto on 2017/10/21.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import XCTest
@testable import ios_FlickrAPI_sk11

class PhotoSearchParamsBuilderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPhotoSearchParamsBuilder() {
        
        let params = PhotoSearchParamsBuilder.create(text: "Test",
                                                     page: 1) as! [String: String]
        
        XCTAssertEqual(params["text"], "Test")
        XCTAssertEqual(params["method"], "flickr.photos.search")
        XCTAssertEqual(params["page"], "1")
        XCTAssertEqual(params["per_page"], "50")
    }
}
