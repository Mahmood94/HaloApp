//
//  ImageSectionController.swift
//  HaloApp
//
//  Created by Mahmood Al-haddad on 9/28/18.
//  Copyright © 2018 Mahmood Al-haddad. All rights reserved.
//

import IGListKit
import UIKit

final class ImageSectionController: ListSectionController, ListDisplayDelegate {
    
    var imageList: [ImageObj]?
    
    override init() {
        super.init()
        displayDelegate = self
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    override func numberOfItems() -> Int {
        guard let imageList = self.imageList else { return 0 }
        return imageList.count
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let _ = self.imageList else { return CGSize.zero }
        return CGSize(width: collectionContext!.containerSize.width/3, height: CGFloat.random(in: 100...250))
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let context = collectionContext, let imageList = self.imageList else { fatalError() }
        
        guard let cell = context.dequeueReusableCell(withNibName: "ImageCell", bundle: nil, for: self, at: index) as? ImageCell else {
            fatalError()
        }
        cell.imageObj = imageList[index]
        return cell
    }
    
    // MARK: ListDisplayDelegate
    
    func listAdapter(_ listAdapter: ListAdapter, willDisplay sectionController: ListSectionController) {
//        print("Will display section \(self.section)")
    }
    
    func listAdapter(_ listAdapter: ListAdapter,
                     willDisplay sectionController: ListSectionController,
                     cell: UICollectionViewCell,
                     at index: Int) {
//        print("Did will display cell \(index) in section \(self.section)")
    }
    
    func listAdapter(_ listAdapter: ListAdapter, didEndDisplaying sectionController: ListSectionController) {
//        print("Did end displaying section \(self.section)")
    }
    
    func listAdapter(_ listAdapter: ListAdapter,
                     didEndDisplaying sectionController: ListSectionController,
                     cell: UICollectionViewCell,
                     at index: Int) {
//        print("Did end displaying cell \(index) in section \(self.section)")
    }
    
    override func didUpdate(to object: Any) {
        guard let objects = object as? DiffableList else { return }
        self.imageList = objects.objectList as? [ImageObj]
    }

}
