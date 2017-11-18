
//
//  RestSearchAPITests.swift
//  ios-GuruNavi-sk12Tests
//
//  Created by S.Emoto on 2017/11/18.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//
import XCTest
@testable import ios_GuruNavi_sk12

class RestSearchAPITests: XCTestCase {
    
    let api = RestSearchAPI()
    let loadable = TestRestSearchLoadable()
    
    override func setUp() {
        super.setUp()
        api.loadable = loadable
    }
    
    override func tearDown() {
        super.tearDown()
        api.loadable = nil
    }
    
    func testSearchAreaCodeAREAL2169() {
        
        let exp = expectation(description: "「AREAL2169」で検索したときのテスト")
        loadable.expectation = exp
        
        api.load(areaCode: "AREAL2169")
        
        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail("waitForExpectationsエラー: \(error)")
            }
            
            if let result = self.loadable.result {
                
                switch result {
                case .loaded(let result) :
                    XCTAssertNotNil(result)
                    XCTAssertTrue(result.rest!.count > 0)
                    XCTAssertEqual(result.pageOffset, "1")
                    
                case .loading: break
                    
                default:
                    XCTFail("バグです")
                }
            }
        }
    }
    
    func testRestSearchRequestCount() {
        
        XCTAssertEqual(api.current(), 1)  // 初回リクエスト時 requestCount = 1
        
        for _ in 0..<2 {
            api.increment()
        }
        XCTAssertEqual(api.current(), 3)  // increment ２回 requestCount = 3
        
        api.reset()
        XCTAssertEqual(api.current(), 1)  // リセット時 requestCount = 1
        
        api.updateTotal(total: 150)
        XCTAssertTrue(api.isMoreRequest())     // requestCount = 1 * perPage = 50 < totalCount = 150　○
        
        XCTAssertTrue(api.isMoreRequest())     // requestCount = 2 * perPage = 50 < totalCount = 150　○
        
        XCTAssertFalse(api.isMoreRequest())    // requestCount = 3 * perPage = 50 < totalCount = 150　Ｘ
    }
}

