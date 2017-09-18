//
//  TimeLineProvider.swift
//  ios-TwitterClient-sk9
//
//  Created by 江本匠 on 2017/08/26.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit
import STV_Extensions

class TimeLineProvider: NSObject {

    let userInfoDao = UserInfoDao()
    
    var timelines = [Tweet]()
    var userInfos = [UserInfo]()
    
    func set(timelines: [Tweet]) {
        self.timelines.removeAll()
        for tweet in timelines {
            self.timelines.append(tweet)
        }
        print("timelines In TimeLineProvider: \(timelines)")
    }
}

//MARK : - UITableViewDataSource
extension TimeLineProvider: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return timelines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TimeLineCell.className,for: indexPath) as! TimeLineCell
        
        let tweet = timelines[indexPath.row]
        //let user = timelines[indexPath.row].user[0]
        //let userInfo: UserInfo? = userInfoDao.findBy(name: tweet.name)[0]
        
        cell.setUser(name: tweet.name)
        cell.setScreen(name: tweet.screenName)
        cell.setTweet(text: tweet.text)
        cell.setIconFrom(urlString: tweet.profileImage)
//        // サムネイル
//        let image = userInfo?.iconImage
//        if image == nil {
//            cell.setIconFrom(urlString: tweet.profileImage)
//        } else {
//            cell.setIconFrom(data: image!)
//        }
        
        return cell
    }
}
