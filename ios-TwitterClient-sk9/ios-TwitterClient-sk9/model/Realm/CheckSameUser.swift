//
//  CheckSameUser.swift
//  ios-TwitterClient-sk9
//
//  Created by 江本匠 on 2017/08/26.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import Foundation

final class CheckSameUser {
    
    func isNotSame(list: [Tweet]) -> [Tweet] {
        var userNames = [String]()
        var userLists = [Tweet]()
        
        for tweet in list {
            if (userNames.filter { $0 == tweet.name }.count > 0) {
                continue
            }
            userNames.append(tweet.name)
            userLists.append(tweet)
        }
        return userLists
    }
}

