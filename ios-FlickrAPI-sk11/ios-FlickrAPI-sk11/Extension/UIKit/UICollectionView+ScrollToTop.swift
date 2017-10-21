//
//  UICollectionView+ScrollToTop.swift
//  ios-FlickrAPI-sk11
//
//  Created by S.Emoto on 2017/10/21.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func scrollToTop() {
        self.contentOffset = CGPoint(x: 0, y: -self.contentInset.top)
    }
}
