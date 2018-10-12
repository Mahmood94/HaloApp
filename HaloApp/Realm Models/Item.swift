//
//  Item.swift
//  HaloApp
//
//  Created by Mahmood Al-haddad on 10/6/18.
//  Copyright © 2018 Mahmood Al-haddad. All rights reserved.
//

import RealmSwift

class Item: Object {
    
    @objc dynamic var itemId: String = UUID().uuidString
    @objc dynamic var body: String = ""
    @objc dynamic var isDone: Bool = false
    @objc dynamic var timestamp: Date = Date()
    
    override static func primaryKey() -> String? {
        return "itemId"
    }
    
}
