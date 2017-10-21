//
//  PhotosSearchStatus.swift
//  ios-FlickrAPI-sk11
//
//  Created by S.Emoto on 2017/10/21.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

enum PhotosSearchStatus {
    case startup
    case loading
    case loaded(PhotoSearchResult)
    case noData
    case offline
    case error
}
