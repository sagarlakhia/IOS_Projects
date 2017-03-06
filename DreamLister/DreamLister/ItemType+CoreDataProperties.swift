//
//  ItemType+CoreDataProperties.swift
//  DreamLister
//
//  Created by Ishan Lakhia on 3/4/17.
//  Copyright © 2017 Sagar Lakhia. All rights reserved.
//

import Foundation
import CoreData

extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType");
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}
