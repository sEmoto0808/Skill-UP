//
//  NoKeywordAlertHelper.swift
//  ios-iTunesSearch-practice
//
//  Created by 江本匠 on 2017/09/09.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import Foundation
import UIKit
import STV_Extensions

protocol NoKeywordAlertHelperDelegate: class {
    /// OKボタンタップ時の処理
    func didTapOK()
}

final class NoKeywordAlertHelper {
    
    weak var delegate: NoKeywordAlertHelperDelegate?
    private var alert: UIAlertController?
    
    /// OKボタンとメッセージを表示するだけのアラートを返す
    /// - タイトルが渡されればタイトルも表示
    ///
    /// - Parameters:
    ///   - message: アラートメッセージ
    ///   - title: アラートタイトル (default: "")
    ///   - delegate: 完了通知用のdelegate (default: nil)
    /// - Returns: 完了通知用のdelegate (default: nil)
    func alert(message: String = "",
               title: String = "NOKEYWORD_MESSAGE".localized(),
               delegate: NoKeywordAlertHelperDelegate? = nil) -> UIAlertController? {
        
        self.delegate = delegate
        
        alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "BUTTON_OK".localized(), style: .cancel) { _ in
            self.delegate?.didTapOK()
        }
        
        alert?.addAction(ok)
        
        return alert
    }
}
