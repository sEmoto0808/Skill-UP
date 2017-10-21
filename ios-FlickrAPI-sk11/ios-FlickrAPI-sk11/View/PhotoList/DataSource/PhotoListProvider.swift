//
//  PhotoListProvider.swift
//  ios-FlickrAPI-sk11
//
//  Created by S.Emoto on 2017/10/21.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import UIKit

final class PhotoListProvider: NSObject {
    
    fileprivate let base = PhotoListBase()
    fileprivate var photos: [Photo] = []
    private var status: PhotosSearchStatus? {
        didSet {
            
            if let status = status {
                base.setStatus(status: status)
            }
        }
    }
    
    func add(status: PhotosSearchStatus, photos: [Photo]) {
        self.status = status
        self.photos = photos
    }
    
    func append(status: PhotosSearchStatus, photos: [Photo]) {
        self.status = status
        
        _ = photos.map {
            self.photos.append($0)
        }
    }
    
    func view() -> PhotoListBase {
        return base
    }
}

//MARK:- UICollectionViewDataSource
extension PhotoListProvider: UICollectionViewDataSource {
    
    // PhotoListのStatusに合った処理を実行
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return base.numberOfItemsInSection(photos: self.photos)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return base.create(collectionView: collectionView,
                           indexPath: indexPath,
                           photos: self.photos)
    }
}

