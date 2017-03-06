//
//  CurrentWeather.swift
//  rainyshinycloudy
//
//  Created by Sagar Lakhia on 3/5/17.
//  Copyright © 2017 Sagar Lakhia. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather{
    
    var _cityName : String!
    var _date : String!
    var _weatherType : String!
    var _currentTemp : Double!
    
    var cityName : String {
        if _cityName == nil{
            _cityName = ""
        }
        return _cityName
    }
    
    var weatherType : String{
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp : Double{
        if _currentTemp == nil{
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    var date : String{
        if _date == nil{
            _date = ""
        }
        var dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        
        let currentDate = dateFormatter.string(from: Date())
        self._date = "\(currentDate)"
        return _date
    }
    
    func downloadWeatherDetails(completed : @escaping DownloadComplete)
    {
        // Alamofire download
        //let currentWeatherURL = URL(string : CURRENT_WEATHER_URL)!
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON{ response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject>
            {
                if let name = dict["name"] as? String
                {
                    self._cityName = name
                    print(name)
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>]
                {
                    if let main = weather[0]["main"] as? String{
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject>{
                    
                    if let currentTemp = main["temp"] as? Double
                    {
                        let kToF = (currentTemp * (9/5) - 459.67)
                        let value = Double(round(10 * kToF/10))
                        self._currentTemp = value;
                        print(self._currentTemp)
                    }
                }
            }
            completed()
        }
    }
}
