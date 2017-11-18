//
//  AreaDataLoader.swift
//  ios-GuruNavi-sk12
//
//  Created by S.Emoto on 2017/11/18.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import ObjectMapper
import STV_Extensions

protocol AreaDataLoadable: class {
    func completed(areas: [Area])
}

final class AreaDataLoader {
    
    weak var loadable: AreaDataLoadable?
    var gareaLarge: [Area] = []
    
    /// 該当エリアの一覧を取得する
    ///
    /// - Parameter prefName: 都道府県名
    /// - Returns: 都道府県情報一覧
    func findArea(prefName: String) {
        
        let area = Bundle.loadJson(fileName: "area")
        
        if let result = Mapper<GuruNaviAreaLarge>().map(JSONString: area) {
            gareaLarge = result.gareaLarge!
        }
        
        let areas = gareaLarge.filter { (area: Area) -> Bool in
            area.pref?.prefName == prefName
        }
        loadable?.completed(areas: areas)
    }
}
