//
//  UIHelpers.swift
//  HaloApp
//
//  Created by Mahmood Al-haddad on 10/10/18.
//  Copyright © 2018 Mahmood Al-haddad. All rights reserved.
//

import UIKit
import Cartography

struct UIHelpers {
    static func addFloatingButton(view: UIView, backgroundColor: UIColor? = nil, labelColor: UIColor? = nil, tag: Int? = 377, selector: Selector) {
        let screenBounds = UIScreen.main.bounds
        
        let button = UIButton()
        button.titleLabel?.text = ""
        button.backgroundColor = backgroundColor
        let label = UILabel()
        label.text = "+"
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30.0)
        if let labelColor = labelColor {
            label.textColor = labelColor
        }
        let viewContainer = UIView()
        button.addSubview(label)
        viewContainer.addSubview(button)
        view.addSubview(viewContainer)
        constrain(viewContainer, button, label) { view1, view2, view3 in
            view1.width == screenBounds.width * 0.1
            view1.height == screenBounds.width * 0.1
            view1.right == view1.superview!.right - (screenBounds.width * 0.05)
            view1.bottom == view1.superview!.bottom - (screenBounds.width * 0.05)
            
            view2.width == view1.width
            view2.height == view1.height
            view2.centerX == view1.centerX
            view2.centerY == view1.centerY
            
            view3.top == view2.top + 5.0
            view3.bottom == view2.bottom - 5.0
            view3.left == view2.left + 5.0
            view3.right == view2.right - 5.0
        }
        
    }
}
