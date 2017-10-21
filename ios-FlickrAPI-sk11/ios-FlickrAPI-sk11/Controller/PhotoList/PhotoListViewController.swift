//
//  PhotoListViewController.swift
//  ios-FlickrAPI-sk11
//
//  Created by S.Emoto on 2017/10/21.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import UIKit

class PhotoListViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var photoSearchText: UITextField!
    @IBOutlet weak var photoSearchButton: UIButton!
    @IBOutlet weak var photoListCollectionView: UICollectionView!
    
    // MARK: - Properties
    fileprivate let photoSearchAPI = PhotoSearchAPI()
    fileprivate let dataSource = PhotoListProvider()
    fileprivate var photoListStatusType = PhotosSearchStatus.startup
    fileprivate var searchText = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
}

//MARK: - UICollectionViewDelegate
extension PhotoListViewController: UICollectionViewDelegate {
    
    // さらに写真があるか確認
    func hasMorePhotoList() -> Bool{
        
        // 一番下までスクロールした時
        if photoListCollectionView.contentOffset.y >=
            (photoListCollectionView.contentSize.height - photoListCollectionView.bounds.size.height) {
            
            if photoSearchAPI.waiting(){ return false }
            return photoSearchAPI.isMoreRequest()
        }
        return false
    }
    
    func nextloadPhotoList() {
        photoSearchAPI.increment()
        photoSearchAPI.load(text: searchText)
    }
    
    // スクロールした時にさらに写真がある場合は再度APIにリクエストを送る
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        guard hasMorePhotoList() else{ return }
        nextloadPhotoList()
    }
}

//MARK:- UICollectionViewDelegateFlowLayout
extension PhotoListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return dataSource.view().cellSize()
    }
}

// MARK: - UITextFieldDelegate
extension PhotoListViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - PhotosSearchLoadable
extension PhotoListViewController: PhotosSearchLoadable {
    
    func setStatus(status: PhotosSearchStatus) {
        photoListStatusType = status
        
        switch status {
        case .loaded(let result):
            updatePhotoList(result: result)
            
        default:
            resetPhotoList(status: status)
        }
    }
}

// MARK: - file extention
extension PhotoListViewController {
    
    func setup() {
        photoListCollectionView.dataSource = dataSource
        // 検索TextFieldの未入力を検知するNotification
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(PhotoListViewController.changeTextField),
                                               name: NSNotification.Name.UITextFieldTextDidChange,
                                               object: nil)
        resetPhotoList(status: .startup)
    }
    
    // 写真一覧を更新する
    func updatePhotoList(result: PhotoSearchResult?) {
        
        if let pages = result?.photos?.pages, let photos = result?.photos {
            photoSearchAPI.updateTotal(total: pages)
            dataSource.append(status: photoListStatusType,
                              photos: photos.photo.map {$0})
        }
        photoListCollectionView.reloadData()
        scrollToTop()
    }
    
    func resetPhotoList(status: PhotosSearchStatus) {
        photoSearchAPI.reset()
        dataSource.add(status: status, photos: [])
        photoListCollectionView.reloadData()
    }
    
    // 一番上までスクロール
    func scrollToTop() {
        
        if photoSearchAPI.current() == 1 {
            photoListCollectionView.scrollToTop()
        }
    }
    
    // APIにリクエストを送る
    func loadPhotoSearch(text: String) {
        
        self.searchText = text
        photoSearchAPI.loadable = self
        photoSearchAPI.load(text: text)
    }
    
    // MARK: - IBAction
    @IBAction func didTapPhotoSearch(_ sender: Any) {
        
        resetPhotoList(status: .loading)
        loadPhotoSearch(text: photoSearchText.text ?? "")
        photoSearchText.resignFirstResponder()
    }
    
    // 検索TextFieldが未入力　→　検索ボタン：非活性
    // 検索TextFieldが入力済　→　検索ボタン：活性
    @objc func changeTextField (sender: NSNotification) {
        if (photoSearchText.text ?? "").isEmpty {
            photoSearchButton.isEnabled = false
        } else {
            photoSearchButton.isEnabled = true
        }
    }
}

