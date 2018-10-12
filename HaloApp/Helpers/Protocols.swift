//
//  Protocols.swift
//  HaloApp
//
//  Created by Mahmood Al-haddad on 10/9/18.
//  Copyright © 2018 Mahmood Al-haddad. All rights reserved.
//

import UIKit

protocol MenuItemDelegate: class {
    func openVC(segue: String) -> Void
}
