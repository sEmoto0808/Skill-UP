//
//  UserMessagesViewController.swift
//  skillup8
//
//  Created by 江本匠 on 2017/07/22.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit
import RealmSwift

class UserMessagesViewController: UIViewController {
    
    let config = Realm.Configuration(
        schemaVersion: 1,
        migrationBlock: { migration, oldSchemaVersion in
            if (oldSchemaVersion < 1) {}
    })

    @IBOutlet weak var messageTableView: UITableView!
    @IBOutlet weak var userMessageTextView: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var dataItems = [Any]()
    var sectionItems = [String]()
    var realm: Realm?
    var messageResult: Results<Object>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageTableView.tableFooterView = UIView(frame: .zero)

        //タップでキーボードを閉じるジェスチャー登録
        let scViewTapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard(_:)))
        self.view.addGestureRecognizer(scViewTapGesture)
        
        realm = try! Realm()
        guard let messageRealm = realm else {
            return
        }
        setItemsFromRealm(realm: messageRealm)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let notificationCenter = NotificationCenter.default
        
        // キーボードを表示する直前
        notificationCenter.addObserver(self, selector: #selector(UserMessagesViewController.handleKeyboardWillShowNotification(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        // キーボードを非表示にする直前
        notificationCenter.addObserver(self, selector: #selector(UserMessagesViewController.handleKeyboardWillHideNotification(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }

}

// MARK: UITableViewDataSource
extension UserMessagesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionItems.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserMessageTableViewCell", for: indexPath) as! UserMessageTableViewCell
        
        cell.setUserMessage(userMessageString: dataItems[indexPath.row] as! String)
        
        return cell
    }
}

// file private
extension UserMessagesViewController {
    
    // キーボードを表示する直前の処理
    func handleKeyboardWillShowNotification(_ notification: Notification) {
        
        // キーボードの高さを取得し、テキストフィールドをキーボードの高さ分上に移動する
        let userInfo = (notification as NSNotification).userInfo!
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentOffset.y = keyboardScreenEndFrame.size.height
        
    }
    
    // キーボードを非表示する直前の処理
    func handleKeyboardWillHideNotification(_ notification: Notification) {
        
        // テキストフィールドを画面の底に移動
        scrollView.contentOffset.y = 0
        
    }
    
    func hideKeyBoard(_ sender: UITapGestureRecognizer) {
        if userMessageTextView.isFirstResponder {
            // キーボードを消す
            userMessageTextView.resignFirstResponder()
        }
    }
    
    func saveRealm(realm: Realm, message: String, date: String) {
        let setMessageAndDate = UserMessage(value: ["message": message,
                                                    "date": date])
        let uniqueObj = UniqueObject(value: ["messageId": 0])
        
        OperateRealmSwift().saveToRealmSwift(realm: realm, object: setMessageAndDate)
        OperateRealmSwift().saveUniqueObjectToRealmSwift(realm: realm, uniqueObject: uniqueObj)
    }
    
    func setItemsFromRealm(realm: Realm) {
        messageResult = OperateRealmSwift().selectRealmSwift(realm: realm, object: UserMessage.self)
        
        var int = 0
        guard let result = messageResult else {
            return
        }
        
        int = result.count
        for i in 0..<int {
            dataItems.append(result[i])
        }
    }
    
    @IBAction func didTapTransmit(_ sender: Any) {
        dataItems.removeAll()
        
        let now = Date()
        let dateFormat = DateFormatter()
        let jaLocale = Locale(identifier: "ja_JP")
        dateFormat.locale = jaLocale
        dateFormat.dateStyle = .medium
        dateFormat.timeStyle = .short
        
        let dateStr = dateFormat.string(from: now)
        
        guard let userText = userMessageTextView.text else {
            return
        }
        guard let messageRealm = realm else {
            return
        }
        
        saveRealm(realm: messageRealm, message: userText, date: dateStr)
        setItemsFromRealm(realm: messageRealm)
        
        userMessageTextView.resignFirstResponder()
        
        messageTableView.reloadData()
    }
    
}
