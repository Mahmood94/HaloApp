//
//  ImageObj.swift
//  HaloApp
//
//  Created by Mahmood Al-haddad on 9/28/18.
//  Copyright © 2018 Mahmood Al-haddad. All rights reserved.
//

import IGListKit

final class ImageObj: ListDiffable {
    
    let id: Int
    let image: String
    
    init(id: Int, image: String) {
        self.id = id
        self.image = image
    }
    
    // MARK: ListDiffable
    
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? ImageObj else { return false }
        return image == object.image
    }
    
}

