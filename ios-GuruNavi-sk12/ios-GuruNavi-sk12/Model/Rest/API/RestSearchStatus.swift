//
//  RestSearchStatus.swift
//  ios-GuruNavi-sk12
//
//  Created by S.Emoto on 2017/11/18.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

enum RestSearchStatus {
    case loading
    case loaded(RestSearchResult)
    case offline
    case error(message: String)
}

