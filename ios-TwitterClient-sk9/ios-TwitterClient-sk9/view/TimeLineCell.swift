//
//  TimeLineCell.swift
//  ios-TwitterClient-sk9
//
//  Created by 江本匠 on 2017/08/26.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit
import Kingfisher

class TimeLineCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak var userIconImageView: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var screenName: UILabel!
    @IBOutlet weak var tweetText: UILabel!

    // セルを再利用する時にnilにする
    override func prepareForReuse() {
        
        userIconImageView.image = nil
    }
    
    // URLからサムネイルをセットする
    func setIconFrom(urlString: String) {
        
        guard let url = URL(string: urlString) else { return }
        userIconImageView.kf.setImage(with: url)
    }
    
    // データからサムネイルをセットする
    func setIconFrom(data: Data) {
        
        let image = UIImage(data: data)
        userIconImageView.image = image
    }
    
    func setUser(name: String) {
        userName.text = name
    }
    
    func setScreen(name: String) {
        screenName.text = name
    }
    
    func setTweet(text: String) {
        tweetText.text = text
    }


}
