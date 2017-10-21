//
//  PhotoListStatusLoading.swift
//  ios-FlickrAPI-sk11
//
//  Created by S.Emoto on 2017/10/21.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import UIKit

class PhotoListStatusLoading: NSObject, PhotoListStatusType {
    
    func message() -> String {
        return NSLocalizedString("MSG_LOADING", comment: "")
    }
}
