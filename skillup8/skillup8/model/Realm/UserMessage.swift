//
//  UserMessage.swift
//  skillup8
//
//  Created by 江本匠 on 2017/07/22.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit
import RealmSwift

class UserMessage: Object {
    
    dynamic var message = ""
    dynamic var date = ""
    
}

class UniqueObject: Object {
    dynamic var messageId = 0
    
    override static func primaryKey() -> String? {
        return "messageId"
    }
    
}
