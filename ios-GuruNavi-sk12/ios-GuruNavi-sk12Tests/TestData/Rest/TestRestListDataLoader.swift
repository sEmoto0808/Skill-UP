//
//  TestRestListDataLoader.swift
//  ios-GuruNavi-sk12Tests
//
//  Created by S.Emoto on 2017/11/18.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import ObjectMapper
@testable import ios_GuruNavi_sk12

final class TestRestListDataLoader {
    
    func fetch() -> RestSearchResult {
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: "restSearchTestData", ofType: "json")
        if let path = path {
            
            let fileHandle = FileHandle(forReadingAtPath: path)
            let jsonData = fileHandle?.readDataToEndOfFile()
            
            if let jsonData = jsonData {
                
                let json = String(data: jsonData,
                                  encoding: String.Encoding.utf8)
                
                if let json = json {
                    
                    if let searchResult = Mapper<RestSearchResult>().map(JSONString: json) {
                        return searchResult
                    }
                }
            }
        }
        fatalError("テストデータが読み込めない")
    }
}

