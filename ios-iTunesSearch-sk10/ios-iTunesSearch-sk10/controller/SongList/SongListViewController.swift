//
//  SongListViewController.swift
//  ios-iTunesSearch-sk10
//
//  Created by S.Emoto on 2017/09/23.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import UIKit
import SVProgressHUD
import STV_Extensions

class SongListViewController: UIViewController {

    // MARK:- Properties
    fileprivate let songListAPI = SongListAPI()
    fileprivate let songInfoDao = SongInfoDao()
    fileprivate let dataSource = SongListProvider()
    
    fileprivate var offlineAlert: UIAlertController?
    fileprivate var noKeywordAlert: UIAlertController?
    
    // MARK: - IBOutlet
    @IBOutlet weak var songListTableView: UITableView!
    @IBOutlet weak var songSearchBar: UISearchBar!
    @IBOutlet weak var noSongLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }

}

// MARK: - SongListLoadable
extension SongListViewController: SongListLoadable {
    
    func setResult(result: SongListStatus) {
        
        SVProgressHUD.dismiss()
        
        switch result {
        case .loaded(let response):
            
            if response.results.count == 0 {
                // 曲が0件だった場合
                noSongLabel.isHidden = false
            } else {
                // 曲が1件以上だった場合
                songListTableView.isHidden = false
                dataSource.set(songLists: response.results)
                songListTableView.reloadData()
            }
            
        case .offline:
            print("offline")
            showOfflineAlert()
            
        case .error(message: let message):
            print("error")
            Logger.debug(message: message)
        }
    }
}

// MARK: - OfflineAlertHelperDelegate
extension SongListViewController: OfflineAlertHelperDelegate {
    func didTapOKButton() {
        Logger.debug(message: "OK")
    }
}

// MARK: - NoKeywordAlertHelperDelegate
extension SongListViewController: NoKeywordAlertHelperDelegate {
    func didTapOK() {
        Logger.debug(message: "OK")
    }
}

// MARK: - UISearchBarDelegate
extension SongListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchKeyword = songSearchBar.text else {
            showNoKeyWordAlert()
            return
        }
        loadSongList(keyword: searchKeyword)
        
        songSearchBar.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        songSearchBar.text = nil
        songSearchBar.endEditing(true)
    }
}

extension SongListViewController {
    
    func setup() {
        songListTableView.dataSource = dataSource
    }
    
    func loadSongList(keyword: String) {
        SVProgressHUD.show()
        songListAPI.loadable = self
        songListAPI.load(keyword: keyword)
    }
    
    // MARK: - Alert
    func showOfflineAlert() {
        if let alert = OfflineAlertHelper().alert(delegate: self) {
            present(alert, animated: true) { self.offlineAlert = nil }
        }
    }
    
    func showNoKeyWordAlert() {
        if let alert = NoKeywordAlertHelper().alert(delegate: self) {
            present(alert, animated: true) { self.noKeywordAlert = nil }
        }
    }
}
