//
//  NetworkChecker.swift
//  swf-flickr-demo
//
//  Created by S.Emoto on 2017/10/17.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import Alamofire

final class NetworkChecker {
    
    // ネットワーク接続状況確認
    //
    // - Returns: true  -> online
    //            false -> offline
    static func isOnline() -> Bool {
        
        let networkReachability = NetworkReachabilityManager()
        networkReachability?.startListening()
        
        return networkReachability?.isReachable ?? false
    }
}
