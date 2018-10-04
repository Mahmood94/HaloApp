//
//  ImageCell.swift
//  HaloApp
//
//  Created by Mahmood Al-haddad on 9/28/18.
//  Copyright © 2018 Mahmood Al-haddad. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    var imageObj: ImageObj?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func layoutSubviews() {
        setupCell()
        super.layoutSubviews()
    }
    
    func setupCell() {
        if let imageObj = self.imageObj {
            let url = URL(string: imageObj.image)
            imageView?.kf.setImage(with: url)
            imageView.kf.indicatorType = .activity
        }
        imageView?.backgroundColor = UIColor.red
        imageView?.contentMode = .scaleAspectFill
    }
}
