//
//  ImageList.swift
//  HaloApp
//
//  Created by Mahmood Al-haddad on 9/28/18.
//  Copyright © 2018 Mahmood Al-haddad. All rights reserved.
//
import IGListKit

final class DiffableList: ListDiffable {
    
    var objectList: [ListDiffable] = []
    
    // MARK: ListDiffable
    
    func diffIdentifier() -> NSObjectProtocol {
        return objectList as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? DiffableList else { return false }
        return objectList.count == object.objectList.count
    }
    
}
