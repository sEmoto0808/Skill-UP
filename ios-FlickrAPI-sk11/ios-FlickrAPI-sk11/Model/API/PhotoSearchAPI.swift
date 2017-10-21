//
//  PhotoSearchAPI.swift
//  ios-FlickrAPI-sk11
//
//  Created by S.Emoto on 2017/10/21.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import Foundation
import ObjectMapper

protocol PhotosSearchLoadable: class{
    func setStatus(status: PhotosSearchStatus)
}

final class PhotoSearchAPI {
    
    var loadable: PhotosSearchLoadable?
    fileprivate var isLoading = false
    private var requestCount = 1  // リクエスト回数
    private var totalCount = 1    // 取得した写真の総数
    
    func waiting() -> Bool {
        return isLoading
    }
    
    func load(text: String) {
        
        guard NetworkChecker.isOnline() else {
            self.loadable?.setStatus(status: .offline)
            return
        }
        
        isLoading = true
        
        let parameters = PhotoSearchParamsBuilder.create(text: text, page: current())
        let router = APIRouter.photosSearch(parameters)
        
        APIClient.request(router: router) { [weak self](response) -> () in
            
            switch response {
            case .success(let result):
                
                if let searchResult = Mapper<PhotoSearchResult>().map(JSONObject: result) {
                    let status = self?.hasPhotoList(result: searchResult) ?? .startup
                    self?.loadable?.setStatus(status: status)
                }
                
            case .failure(let error):
                print("error: \(error)")
                self?.loadable?.setStatus(status: .error)
            }
            self?.isLoading = false
        }
    }
    
    private func hasPhotoList(result: PhotoSearchResult) -> PhotosSearchStatus {
        
        return (result.photos?.photo.count == 0) ?
            PhotosSearchStatus.noData : PhotosSearchStatus.loaded(result)
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
        return totalCount > requestCount * PhotoSearchParamsBuilder.perPage
    }
}

