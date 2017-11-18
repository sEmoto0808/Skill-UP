//
//  AreaListProvider.swift
//  ios-GuruNavi-sk12
//
//  Created by S.Emoto on 2017/11/18.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import UIKit

class AreaListProvider: NSObject {

    var areaList = [Area]()
    
    func set(areaList: [Area]) {
        self.areaList = areaList
    }
    
    /// エリア情報を取得する
    ///
    /// - Parameter row: TableViewの行番号
    /// - Returns: エリア情報
    func findArea(row: Int) -> Area {
        return areaList[row]
    }
}

extension AreaListProvider: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return areaList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AreaListCell.className,for: indexPath) as! AreaListCell
        
        cell.textLabel?.text = areaList[indexPath.row].areanameL
        
        return cell
    }
}
