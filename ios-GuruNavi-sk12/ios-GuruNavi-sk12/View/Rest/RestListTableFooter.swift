//
//  RestListTableFooter.swift
//  ios-GuruNavi-sk12
//
//  Created by S.Emoto on 2017/11/18.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import UIKit

class RestListTableFooter: UIView {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    /// インジケーターのアニメーションを開始する
    func start() {
        indicator.startAnimating()
    }
    
    /// インジケーターのアニメーションを停止する
    func stop() {
        
        if indicator.isAnimating {
            indicator.stopAnimating()
        }
    }

}
