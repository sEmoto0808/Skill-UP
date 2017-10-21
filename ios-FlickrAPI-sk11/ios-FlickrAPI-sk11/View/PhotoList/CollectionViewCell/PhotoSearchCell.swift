//
//  PhotoSearchCell.swift
//  ios-FlickrAPI-sk11
//
//  Created by S.Emoto on 2017/10/21.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import UIKit
import AlamofireImage

final class PhotoSearchCell: UICollectionViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak var photoImageView: UIImageView!
    
    static var identifier: String {
        get {
            return String(describing: self)
        }
    }
    
    // 写真のURLを生成
    var photo: Photo? = nil {
        didSet {
            if let photo = photo {
                self.photoURL = PhotoImageURLBuilder.create(photo: photo)
            }
        }
    }
    
    // 写真をImageViewにセット
    fileprivate var photoURL: String = "" {
        
        didSet {
            
            if let url = URL(string: photoURL) {
                self.photoImageView.af_setImage(withURL: url)
            } else {
                fatalError("写真のURLが不正")
            }
        }
    }
    
    override func prepareForReuse() {
        self.photoImageView.image = nil
    }
    
}
