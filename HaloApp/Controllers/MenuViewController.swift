//
//  MenuViewController.swift
//  HaloApp
//
//  Created by Mahmood Al-haddad on 10/6/18.
//  Copyright © 2018 Mahmood Al-haddad. All rights reserved.
//

import UIKit
import IGListKit
import Cartography

class MenuViewController: UIViewController, ListAdapterDataSource, MenuItemDelegate {

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
        for menuItem in Constants.menu {
            objects.objectList.append(menuItem)
        }
        return [objects]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        let sectionController = MenuSectionController()
        sectionController.menuItemDelegate = self
        return sectionController
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        let view = UIView()
        let label = UILabel()
        view.addSubview(label)
        label.text = "Empty"
        label.textAlignment = .center
        constrain(label) { label in
            let superView = label.superview!
            label.center == superView.center
            label.width == superView.width
        }
        return view
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    func openVC(segue: String) {
        self.performSegue(withIdentifier: segue, sender: nil)
    }

}
