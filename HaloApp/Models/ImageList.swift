//
//  ImageList.swift
//  HaloApp
//
//  Created by Mahmood Al-haddad on 9/28/18.
//  Copyright © 2018 Mahmood Al-haddad. All rights reserved.
//


import IGListKit

final class ImageList: ListDiffable {
    
    var images: [ImageObj] = []
    
    // MARK: ListDiffable
    
    func diffIdentifier() -> NSObjectProtocol {
        return images as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? ImageList else { return false }
        return images.count == object.images.count
    }
    
}


