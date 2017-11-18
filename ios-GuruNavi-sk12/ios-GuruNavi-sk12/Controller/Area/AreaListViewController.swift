//
//  AreaListViewController.swift
//  ios-GuruNavi-sk12
//
//  Created by S.Emoto on 2017/11/18.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import UIKit

class AreaListViewController: UIViewController {

    @IBOutlet weak var areaListTableView: UITableView!
    
    fileprivate let dataSource = AreaListProvider()
    fileprivate let areaDataLoader = AreaDataLoader()
    
    fileprivate let prefName = "東京都"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

// MARK: - UITableViewDelegate
extension AreaListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        transitionRestListViewController(indexPath: indexPath)
    }
}

// MARK: - AreaDataLoadable
extension AreaListViewController: AreaDataLoadable {
    
    func completed(areas: [Area]) {
        dataSource.set(areaList: areas)
    }
}

extension AreaListViewController {
    
    func setup() {
        areaListTableView.dataSource = dataSource
        loadArea(prefName: prefName)
        hideBackButtonText()
    }
    
    /// 東京都のエリア情報の取得
    private func loadArea(prefName: String) {
        areaDataLoader.loadable = self
        areaDataLoader.findArea(prefName: prefName)
    }
    
    /// レストラン一覧画面へ遷移する
    ///
    /// - Parameter indexPath: TableViewの行番号
    private func transitionRestListViewController(indexPath: IndexPath) {
        
        let vc = RestListViewController
            .create(area: dataSource.findArea(row: indexPath.row))
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
