//
//  Item+CoreDataClass.swift
//  DreamLister
//
//  Created by Sagar Lakhia on 3/4/17.
//  Copyright © 2017 Sagar Lakhia. All rights reserved.
//

import Foundation
import CoreData


public class Item: NSManagedObject {

    public override func awakeFromInsert() {
        
        super.awakeFromInsert()
        
        self.created = NSDate()
    }
}
