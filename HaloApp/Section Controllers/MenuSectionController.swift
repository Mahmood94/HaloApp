//
//  ImageSectionController.swift
//  HaloApp
//
//  Created by Mahmood Al-haddad on 9/28/18.
//  Copyright © 2018 Mahmood Al-haddad. All rights reserved.
//

import IGListKit
import UIKit
import Cartography

final class MenuSectionController: ListSectionController {
    
    weak var menuItemDelegate: MenuItemDelegate?
    var menuList: [MenuItem]?
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    override func numberOfItems() -> Int {
        guard let menuList = self.menuList else { return 0 }
        return menuList.count
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext, nil != self.menuList else { return CGSize.zero }
        return CGSize(width: context.containerSize.width, height: context.containerSize.width * 0.15)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let context = collectionContext, let menuList = self.menuList else { fatalError() }
        
        let cell = context.dequeueReusableCell(of: UICollectionViewCell.self, withReuseIdentifier: "MenuItem", for: self, at: index)
        let menuItem = menuList[index]
        let label = UILabel()
        label.text = menuItem.menuText
        cell.addSubview(label)
        label.font = UIFont.systemFont(ofSize: 20.0)
        constrain(label) { label in
            label.centerY == label.superview!.centerY
            label.width == label.superview!.width - 20.0
            label.left == label.superview!.left + 15.0
        }
        let border = UIView()
        border.backgroundColor = UIColor.lightGray
        cell.addSubview(border)
        constrain(border) { border in
            border.width == border.superview!.width
            border.height == 0.5
            border.bottom == border.superview!.bottom
        }
        return cell
    }
    
    override func didSelectItem(at index: Int) {
        guard let menuList = self.menuList else { return }
        self.menuItemDelegate?.openVC(segue: menuList[index].menuSegue)
    }
    
    override func didUpdate(to object: Any) {
        guard let objects = object as? DiffableList else { return }
        self.menuList = objects.objectList as? [MenuItem]
    }

}
