//
//  UserMessageTableViewCell.swift
//  skillup8
//
//  Created by 江本匠 on 2017/07/22.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit

class UserMessageTableViewCell: UITableViewCell {

    @IBOutlet weak var userMessageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

// file private
extension UserMessageTableViewCell {
    
    func setup() {
        
        self.layer.cornerRadius = 30.0
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor.blue
    }
    
    func setUserMessage(userMessageString: String) {
        
        userMessageLabel.text = userMessageString
        
    }
}
