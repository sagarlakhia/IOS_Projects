//
//  WeatherCell.swift
//  rainyshinycloudy
//
//  Created by Sagar Lakhia on 3/5/17.
//  Copyright © 2017 Sagar Lakhia. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var dayLabel: UILabel!
    
    @IBOutlet weak var lowTempLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    
    func configureCell(forecast :Forecast){
        lowTempLabel.text = "\(forecast.lowTemp)"
        highTempLabel.text = "\(forecast.highTemp)"
        weatherTypeLabel.text = forecast.weatherType
        dayLabel.text = forecast.date
        
        weatherImage.image = UIImage(named: forecast.weatherType)
    }
    
}
