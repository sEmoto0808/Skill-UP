//
//  PhotoListStatusType.swift
//  ios-FlickrAPI-sk11
//
//  Created by S.Emoto on 2017/10/21.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import UIKit

protocol PhotoListStatusType {
    // APIリクエストの結果で共通で使うメソッドを宣言
    // メソッドの処理内容は各パターンで実装
    func create(collectionView: UICollectionView, indexPath: IndexPath, photos: [Photo]) -> UICollectionViewCell
    func numberOfItemsInSection(photos: [Photo]) -> Int
    func message() -> String
    func cellSize() -> CGSize
}

extension PhotoListStatusType where Self: NSObject{
    
    // リクエスト成功時以外は以下の処理を共通で実行
    func create(collectionView: UICollectionView,
                indexPath: IndexPath,
                photos: [Photo]) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ExceptCell.identifier,
            for: indexPath) as! ExceptCell
        
        cell.messageLabel.text = self.message()
        
        return cell
    }
    
    func numberOfItemsInSection(photos: [Photo]) -> Int {
        return 1
    }
    
    func cellSize() -> CGSize {
        
        let topMargin = CGFloat(110)
        let screenSize = UIScreen.main.bounds
        let cellWidth = screenSize.width
        let cellHeight = (screenSize.height - topMargin)
        return CGSize(width: cellWidth, height: cellHeight)
    }
}


