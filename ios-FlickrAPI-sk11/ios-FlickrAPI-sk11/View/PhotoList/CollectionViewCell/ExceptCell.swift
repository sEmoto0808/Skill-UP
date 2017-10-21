//
//  ExceptCell.swift
//  ios-FlickrAPI-sk11
//
//  Created by S.Emoto on 2017/10/21.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import UIKit

class ExceptCell: UICollectionViewCell {
    
    @IBOutlet weak var messageLabel: UILabel!
    
    static var identifier: String {
        get {
            return String(describing: self)
        }
    }
    
    var message = "" {
        
        didSet {
            messageLabel.text = message
        }
    }
}
