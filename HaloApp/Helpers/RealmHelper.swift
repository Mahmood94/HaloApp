//
//  RealmHelper.swift
//  HaloApp
//
//  Created by Mahmood Al-haddad on 10/10/18.
//  Copyright © 2018 Mahmood Al-haddad. All rights reserved.
//

import RealmSwift

struct RealmHelper {
    static var realmDB: Realm = {
        let syncConfig = SyncConfiguration(user: SyncUser.current!, realmURL: Constants.REALM_URL)
        return try! Realm(configuration: Realm.Configuration(syncConfiguration: syncConfig, objectTypes:[Item.self]))
    }()
}
