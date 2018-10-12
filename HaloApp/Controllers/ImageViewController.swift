//
//  ViewController.swift
//  HaloApp
//
//  Created by Mahmood Al-haddad on 9/25/18.
//  Copyright © 2018 Mahmood Al-haddad. All rights reserved.
//

import UIKit
import Kingfisher
import IGListKit
import Realm
import RealmSwift

class ImageViewController: UIViewController, ListAdapterDataSource {

    @IBOutlet weak var imageView: UIImageView!
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    // MARK: ListAdapterDataSource
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        let objects = DiffableList()
        for imageId in 1...20 {
            let imageObj = ImageObj(id: imageId, image: "https://picsum.photos/200/300/?random")
            objects.objectList.append(imageObj)
        }
        return [objects]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return ImageSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? { return nil }
    
}
