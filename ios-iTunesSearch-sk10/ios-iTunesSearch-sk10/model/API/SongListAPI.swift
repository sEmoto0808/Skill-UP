//
//  SongListAPI.swift
//  ios-iTunesSearch-sk10
//
//  Created by S.Emoto on 2017/09/23.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import ObjectMapper

enum SongListStatus {
    case loaded(Response)
    case offline
    case error(message: String)
}

protocol SongListLoadable: class {
    func setResult(result: SongListStatus)
}

final class SongListAPI {
    
    weak var loadable: SongListLoadable?
    
    /// iTunes検索API実行
    ///
    /// - Parameters:
    ///   - keyword: 検索keyword
    func load(keyword: String) {
        
        guard NetworkChecker.isOnline() else {
            loadable?.setResult(result: .offline)
            return
        }
        
        let params = SongListParamsBuilder.create(keyword: keyword)
        
        let router = APIRouter.musicSearch(params)
        
        APIClient.request(router: router) { [weak self] (response) in
            
            guard let `self` = self else { return }
            
            switch response {
            case .success(let result):
                if let result = Mapper<Response>().map(JSONObject: result) {
                    self.loadable?.setResult(result: .loaded(result))
                }
                
            case .failure(let error):
                self.loadable?.setResult(result: .error(message: error.localizedDescription))
            }
        }
    }
}

