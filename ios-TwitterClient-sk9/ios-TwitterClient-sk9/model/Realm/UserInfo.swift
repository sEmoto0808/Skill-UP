//
//  UserInfo.swift
//  ios-TwitterClient-sk9
//
//  Created by 江本匠 on 2017/08/26.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import Foundation
import RealmSwift

final class UserInfo: Object {
    
    dynamic var userName = ""
    dynamic var iconImage = Data()
}
