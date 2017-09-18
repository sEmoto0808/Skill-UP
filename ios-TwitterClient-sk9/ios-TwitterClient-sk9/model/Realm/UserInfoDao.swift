//
//  UserInfoDao.swift
//  ios-TwitterClient-sk9
//
//  Created by 江本匠 on 2017/08/26.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import Foundation
import RealmSwift
import STV_Extensions

final class UserInfoDao {
    
    static let dao = RealmDaoBase<UserInfo>()
    
    /// サムネイル画像のデータを追加する
    ///
    /// - Parameters:
    ///   - name: ユーザ名
    ///   - imageURL: サムネイル画像のURL
    func add(name: String, imageURL: String) {
        
        let object = UserInfo()
        object.userName = name
        
        guard let url = URL(string: imageURL) else { return }
        guard let imageData = try? Data(contentsOf: url) else { return }
        object.iconImage = imageData
        
        UserInfoDao.dao.add(data: object)
    }
    
    /// ユーザ名で検索する
    ///
    /// - Parameter:
    ///   - name: ユーザ名
    /// - Returns: ユーザ情報
    func findBy(name: String) -> [UserInfo] {
        
        let condition = "userName == \(name)"
        
        return UserInfoDao.dao.findAll().filter(condition).map { UserInfo(value: $0) }
    }
}

