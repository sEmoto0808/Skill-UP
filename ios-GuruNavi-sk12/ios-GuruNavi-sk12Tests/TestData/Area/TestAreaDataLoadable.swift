//
//  TestAreaDataLoadable.swift
//  ios-GuruNavi-sk12Tests
//
//  Created by S.Emoto on 2017/11/18.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import XCTest
@testable import ios_GuruNavi_sk12

final class TestAreaDataLoadable: AreaDataLoadable {
    
    var areas: [Area] = []
    var asyncExpectation: XCTestExpectation?
    
    func completed(areas: [Area]) {
        
        guard let expectation = asyncExpectation else {
            XCTFail("AreaFilterLoadableが正しく設定されていない")
            return
        }
        
        self.areas = areas
        expectation.fulfill()
    }
}
