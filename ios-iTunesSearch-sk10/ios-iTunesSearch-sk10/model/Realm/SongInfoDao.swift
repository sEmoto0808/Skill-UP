//
//  SongInfoDao.swift
//  ios-iTunesSearch-sk10
//
//  Created by S.Emoto on 2017/09/23.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import Foundation
import RealmSwift
import STV_Extensions

final class SongInfoDao {
    
    static let dao = RealmDaoBase<SongInfo>()
    
    /// サムネイル画像のデータを追加する
    ///
    /// - Parameters:
    ///   - id: 曲のID
    ///   - imageURL: サムネイル画像のURL
    func add(model: SongInfo) {
        
        // 登録済みであればreturn
        if let _ = findBy(id: model.songId) { return }
        let object = SongInfo()
        object.songId = model.songId
        object.iconImage = model.iconImage
        
        SongInfoDao.dao.add(data: object)
        
    }
    
    /// IDで検索する
    ///
    /// - Parameter:
    ///   - id: 曲のID
    /// - Returns: 曲の情報
    func findBy(id: String) -> SongInfo? {
        
        return SongInfoDao.dao.findByKey(key: id as AnyObject)
    }
}
