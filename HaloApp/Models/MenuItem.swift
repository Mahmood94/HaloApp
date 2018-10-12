//
//  MenuItem.swift
//  HaloApp
//
//  Created by Mahmood Al-haddad on 10/6/18.
//  Copyright © 2018 Mahmood Al-haddad. All rights reserved.
//

import IGListKit

final class MenuItem: ListDiffable {
    
    var menuText: String = ""
    var menuType: UIViewController.Type = UIViewController.self
    var menuSegue: String = ""
    
    init(menuText: String, menuType: UIViewController.Type, menuSegue: String) {
        self.menuText = menuText
        self.menuType = menuType
        self.menuSegue = menuSegue
    }
    
    // MARK: ListDiffable
    
    func diffIdentifier() -> NSObjectProtocol {
        return menuText as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? MenuItem else { return false }
        return menuText == object.menuText
    }
    
}

