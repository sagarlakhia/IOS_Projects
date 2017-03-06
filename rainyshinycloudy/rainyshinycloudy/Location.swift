//
//  Location.swift
//  rainyshinycloudy
//
//  Created by Sagar Lakhia on 3/5/17.
//  Copyright © 2017 Sagar Lakhia. All rights reserved.
//

import CoreLocation


class Location{
    static var sharedInstance = Location()
    
    private init(){}
    
    var latitude:Double!
    var longitude:Double!
}
