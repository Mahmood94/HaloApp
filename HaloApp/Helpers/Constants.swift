//
//  Constants.swift
//  HaloApp
//
//  Created by Mahmood Al-haddad on 10/6/18.
//  Copyright © 2018 Mahmood Al-haddad. All rights reserved.
//

import UIKit

struct Constants {
    
    static let menu: [MenuItem] = [
        MenuItem(menuText: "Images", menuType: ImageViewController.self, menuSegue: "imagesVC"),
        MenuItem(menuText: "Realm Items", menuType: ItemsViewController.self, menuSegue: "itemsVC")
    ]
    
    static let MY_INSTANCE_ADDRESS = "handcrafted-steel-keyboard.de1a.cloud.realm.io" // <- update this
    
    static let AUTH_URL  = URL(string: "https://\(MY_INSTANCE_ADDRESS)")!
    static let REALM_URL = URL(string: "realms://\(MY_INSTANCE_ADDRESS)/ToDo")!
}
