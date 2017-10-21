//
//  PhotoListBase.swift
//  ios-FlickrAPI-sk11
//
//  Created by S.Emoto on 2017/10/21.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import UIKit

class PhotoListBase: NSObject {
    
    private var viewType: PhotoListStatusType?
    
    func setStatus(status: PhotosSearchStatus) {
        
        switch status {
            
        case .startup:
            viewType = PhotoListStatusStartup()
            
        case .loading:
            viewType = PhotoListStatusLoading()
            
        case .loaded:
            viewType = PhotoListStatusLoaded()
            
        case .noData:
            viewType = PhotoListStatusNoData()
            
        case .offline:
            viewType = PhotoListStatusOffline()
            
        default:
            fatalError("NGパターンです")
        }
    }
    
    func create(collectionView: UICollectionView,
                indexPath: IndexPath,
                photos: [Photo]) -> UICollectionViewCell {
        
        return viewType?.create(collectionView: collectionView,
                                indexPath: indexPath,
                                photos: photos) ?? UICollectionViewCell()
    }
    
    func numberOfItemsInSection(photos: [Photo]) -> Int {
        return viewType?.numberOfItemsInSection(photos: photos) ?? 0
    }
    
    func message() -> String {
        return viewType?.message() ?? ""
    }
    func cellSize() -> CGSize {
        return viewType?.cellSize() ?? CGSize.zero
    }
}

