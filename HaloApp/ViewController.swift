//
//  ViewController.swift
//  HaloApp
//
//  Created by Mahmood Al-haddad on 9/25/18.
//  Copyright © 2018 Mahmood Al-haddad. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://picsum.photos/200/300/?random")
        imageView.kf.setImage(with: url)
        imageView.backgroundColor = UIColor.red
        imageView.contentMode = .scaleAspectFit
    }

}
