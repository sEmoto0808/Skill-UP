//
//  PhotoListStatusLoaded.swift
//  ios-FlickrAPI-sk11
//
//  Created by S.Emoto on 2017/10/21.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import UIKit

final class PhotoListStatusLoaded: NSObject {
    
}

// MARK: - PhotoListStatusType
extension PhotoListStatusLoaded: PhotoListStatusType {
    
    func create(collectionView: UICollectionView,
                indexPath: IndexPath,
                photos: [Photo]) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PhotoSearchCell.identifier,
            for: indexPath) as! PhotoSearchCell
        
        cell.photo = photos[indexPath.row]
        return cell
    }
    
    func numberOfItemsInSection(photos: [Photo]) -> Int {
        return photos.count
    }
    
    func message() -> String {
        fatalError("このパターンはありません")
    }
    
    func cellSize() -> CGSize {
        
        let topMargin = CGFloat(110)
        let screenSize = UIScreen.main.bounds
        let screenPerWidth = CGFloat(2)
        let screenPerrHeight = CGFloat(5)
        
        let cellWidth = (screenSize.width - CGFloat(10)) / screenPerWidth
        let cellHeight = (screenSize.height - topMargin) / screenPerrHeight
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
