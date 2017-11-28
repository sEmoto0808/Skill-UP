//
//  RestListProvider.swift
//  ios-GuruNavi-sk12
//
//  Created by S.Emoto on 2017/11/18.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import UIKit

class RestListProvider: NSObject {

    private var restList = [Rest]()
    
    func set(restList: [Rest]) {
        if restList.isEmpty {
            self.restList = restList
            return
        }
        
        _ = restList.map {
            self.restList.append($0)
        }
    }
    
    func findRest(row:Int) -> Rest {
        return restList[row]
    }
}

extension RestListProvider: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RestListCell.className,for: indexPath) as! RestListCell
        
        cell.restData = findRest(row: indexPath.row)
        
        return cell
    }
}
