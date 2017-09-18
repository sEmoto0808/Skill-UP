//
//  AccountChecker.swift
//  ios-TwitterClient-sk9
//
//  Created by 江本匠 on 2017/08/26.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit
import Foundation

final class AccountChecker {
    
    func hasNoAccount() {
        // 設定画面を開く
        guard let url = URL(string: UIApplicationOpenSettingsURLString) else { return }
        if UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}
