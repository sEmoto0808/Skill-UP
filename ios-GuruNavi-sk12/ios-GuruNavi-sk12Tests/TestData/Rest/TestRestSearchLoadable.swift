//
//  TestRestSearchLoadable.swift
//  ios-GuruNavi-sk12Tests
//
//  Created by S.Emoto on 2017/11/18.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import XCTest
@testable import ios_GuruNavi_sk12

final class TestRestSearchLoadable: RestSearchLoadable {
    
    var result: RestSearchStatus?
    var expectation: XCTestExpectation?
    
    func setStatus(status: RestSearchStatus) {
        
        guard let expectation = expectation else {
            XCTFail("RestSearchLoadableが正しく設定されていない")
            return
        }
        
        self.result = status
        expectation.fulfill()
    }
}

