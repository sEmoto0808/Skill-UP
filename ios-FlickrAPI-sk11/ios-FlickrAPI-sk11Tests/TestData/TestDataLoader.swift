//
//  TestDataLoader.swift
//  ios-FlickrAPI-sk11Tests
//
//  Created by S.Emoto on 2017/10/21.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import ObjectMapper
@testable import ios_FlickrAPI_sk11

final class TestDataLoader {
    
    func fetch() -> PhotoSearchResult {
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: "flickrTestData", ofType: "json")
        if let path = path {
            
            let fileHandle = FileHandle(forReadingAtPath: path)
            let jsonData = fileHandle?.readDataToEndOfFile()
            
            if let jsonData = jsonData {
                
                let json = String(data: jsonData,
                                  encoding: String.Encoding.utf8)
                
                if let json = json {
                    
                    if let searchResult = Mapper<PhotoSearchResult>().map(JSONString: json) {
                        return searchResult
                    }
                }
            }
        }
        fatalError("テストデータが読み込めない")
    }
}
