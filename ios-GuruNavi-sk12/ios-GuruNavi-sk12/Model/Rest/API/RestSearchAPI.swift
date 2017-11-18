//
//  RestSearchAPI.swift
//  ios-GuruNavi-sk12
//
//  Created by S.Emoto on 2017/11/18.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import Foundation
import ObjectMapper

protocol RestSearchLoadable: class{
    func setStatus(status: RestSearchStatus)
}

final class RestSearchAPI {
    
    var loadable: RestSearchLoadable?
    var requestCount = 1  // リクエスト回数
    private var totalCount = 1    // 取得した写真の総数
    
    func load(areaCode: String, offset: Int = 1) {
        
        guard NetworkChecker.isOnline() else {
            self.loadable?.setStatus(status: .offline)
            return
        }
        
        self.loadable?.setStatus(status: .loading)
        
        let parameters = RestSearchParamsBuilder.create(areaCode: areaCode, offset: offset)
        let router = APIRouter.restSearch(parameters)
        
        APIClient.request(router: router) { [weak self](response) -> () in
            
            switch response {
            case .success(let result):
                
                if let searchResult = Mapper<RestSearchResult>().map(JSONObject: result) {
                    self?.loadable?.setStatus(status: .loaded(searchResult))
                }
                
            case .failure(let error):
                print("error: \(error)")
                self?.loadable?.setStatus(status: .error(message: error.localizedDescription))
            }
        }
    }
    
    //MARK:- リクエスト回数の管理
    func current() -> Int {
        return requestCount
    }
    
    func reset() {
        requestCount = 1
    }
    
    func increment() {
        requestCount += 1
    }
    
    func updateTotal(total: Int) {
        self.totalCount = total
    }
    
    func isMoreRequest() -> Bool{
        
        if totalCount > requestCount * RestSearchParamsBuilder.perPage {
            increment()
            return true
        } else {
            return false
        }
    }
}



