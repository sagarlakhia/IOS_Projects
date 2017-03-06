//
//  Constants.swift
//  rainyshinycloudy
//
//  Created by Sagar Lakhia on 3/5/17.
//  Copyright © 2017 Sagar Lakhia. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LAT = "lat="
let LON = "&lon="
let APP_ID = "&appid="
let OPEN_WEATHER_API_KEY = "aacaf6094dde02beab53bd7b5beb9cb3"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LAT)\(Location.sharedInstance.latitude!)\(LON)\(Location.sharedInstance.longitude!)\(APP_ID)\(OPEN_WEATHER_API_KEY)"
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&appid=aacaf6094dde02beab53bd7b5beb9cb3"
