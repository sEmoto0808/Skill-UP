//
//  OperateRealmSwift.swift
//  skillup8
//
//  Created by 江本匠 on 2017/07/22.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit
import RealmSwift

class OperateRealmSwift: Object {
    
    func saveToRealmSwift(realm: Realm, object: Any) {
        try! realm.write {
            realm.add(object as! Object)
        }
    }
    
    func saveUniqueObjectToRealmSwift(realm: Realm, uniqueObject: Any) {
        try! realm.write {
            realm.add(uniqueObject as! Object, update: true)
        }
    }
    
    func selectRealmSwift(realm: Realm, object: Any) -> Results<Object> {
        let results = realm.objects(object as! Object.Type)
        
        print("Result: \(results)")
        
        return results
    }
    
    func deleteRealmSwift(realm: Realm, object: Any) {
        
        try! realm.write {
            realm.delete(object as! Object)
        }
    }
    
    func deleteAllRealmSwift(realm: Realm, object: Any) {
        let results = realm.objects(object as! Object.Type)
        
        try! realm.write {
            realm.delete(results)
        }
    }
    
}

