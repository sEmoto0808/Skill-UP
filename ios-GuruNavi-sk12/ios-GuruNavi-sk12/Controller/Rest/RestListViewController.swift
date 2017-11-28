//
//  RestListViewController.swift
//  ios-GuruNavi-sk12
//
//  Created by S.Emoto on 2017/11/18.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import UIKit

class RestListViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var restListTableView: UITableView!
    @IBOutlet var nextLoadingFooter: RestListTableFooter!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    // MARK: - Instance
    private let dataSource = RestListProvider()
    private let restSearchAPI = RestSearchAPI()
    
    // MARK: - Property
    private var area: Area?
    private var lastAreaCode = ""
    private var offlineAlert: UIAlertController?
    
    //MARK : - Factorys
    class func create(area: Area) -> RestListViewController {
        
        if let vc = UIStoryboard
            .viewController(storyboardName: RestListViewController.className,
                            identifier: RestListViewController.className) as? RestListViewController {
            vc.area = area
            return vc
        }
        fatalError("unwap RestListViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

// MARK: - UIScrollViewDelegate
extension RestListViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        
        guard restListTableView.isScrollEnd() && !loadingIndicator.isAnimating else {
            return
        }
        if restSearchAPI.isMoreRequest() {
            nextloadRestList(offset: restSearchAPI.requestCount)
        } else {
            endloadRestList()
        }
    }
    
    // 2回目以降レストラン一覧を取得する
    func nextloadRestList(offset: Int) {
        restSearchAPI.load(areaCode: lastAreaCode, offset: offset)
    }
    
    func endloadRestList() {
        nextLoadingFooter.stop()
        restListTableView.removeTableFooterView()
    }
}

//MARK : -UITableViewDelegate
extension RestListViewController: UITableViewDelegate {}

// MARK: - RestSearchLoadable
extension RestListViewController: RestSearchLoadable {
    
    func setStatus(status: RestSearchStatus) {
        
        switch status {
        case .loading:
            loadingRest()
            
        case .loaded(let result):
            loadedRest(result: result)
            
        case .offline:
            showOfflineAlert()
            
        case .error(let message) :
            fatalError(message.description)
        }
    }
    
    func loadingRest() {
        showLoadingIndicator()
    }
    
    /// ロード完了時の処理
    func loadedRest(result: RestSearchResult) {
        hiddenLoadingIndicator()
        guard let rests = result.rest else {
            return
        }
        dataSource.set(restList: rests)
        updateTitle(count: Int(result.totalHit)!)
        restSearchAPI.updateTotal(total: Int(result.totalHit)!)
        restListTableView.reloadData()
        restListTableView.tableFooterView?.isHidden = false
    }
    
    func showLoadingIndicator() {
        loadingIndicator.isHidden = false
        loadingIndicator.startAnimating()
    }
    
    func hiddenLoadingIndicator() {
        loadingIndicator.isHidden = true
        
        if loadingIndicator.isAnimating {
            loadingIndicator.stopAnimating()
        }
    }
}

// MARK: - OfflineAlertHelperDelegate
extension RestListViewController: OfflineAlertHelperDelegate {
    func didTapOKButton() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension RestListViewController {
    
    func setup() {
        restListTableView.dataSource = dataSource
        restListTableView.delegate = self
        loadingIndicator.isHidden = true
        if let area = self.area {
            loadRest(areaCode: area.areacodeL)
        }
        setTitle()
        setupTableViewFooter()
    }
    
    // 初回レストラン一覧を取得する
    func loadRest(areaCode: String) {
        restSearchAPI.loadable = self
        restSearchAPI.reset()
        restSearchAPI.load(areaCode: areaCode)
        lastAreaCode = areaCode
    }
    
    func setTitle() {
        if let area = self.area {
            self.title = String(format: "REST_TITLE".localized(),
                                area.areanameL)
        }
    }
    
    func updateTitle(count: Int) {
        if let area = self.area {
            self.title = String(format: "REST_COUNT".localized(),
                                area.areanameL,
                                count.decimalStr)
        }
    }
    
    func setupTableViewFooter() {
        restListTableView.tableFooterView = nextLoadingFooter
        restListTableView.tableFooterView?.isHidden = true
        nextLoadingFooter.start()
    }
    
    // MARK: - Alert
    func showOfflineAlert() {
        if let alert = OfflineAlertHelper().alert(delegate: self) {
            present(alert, animated: true) { self.offlineAlert = nil }
        }
    }
}
