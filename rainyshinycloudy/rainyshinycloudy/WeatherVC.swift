//
//  WeatherVC.swift
//  rainyshinycloudy
//
//  Created by Sagar Lakhia on 3/4/17.
//  Copyright © 2017 Sagar Lakhia. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var currentTempLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather :CurrentWeather!
    var forecast : Forecast!
    var forecasts = [Forecast]()
    let locationManager = CLLocationManager()
    var currentLocation : CLLocation!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather = CurrentWeather()
    
    }
    
    func locationAuthStatus(){
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            currentLocation = locationManager.location
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
           // print(Location.sharedInstance.longitude, Location.sharedInstance.latitude)
            
            currentWeather.downloadWeatherDetails {
                self.downloadForecastData {
                    self.updateUI()
                }
            }
        }
        else{
            locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationAuthStatus()
    
    }
    func downloadForecastData(completed:@escaping DownloadComplete)
    {
        //let forecastURL = URL(string: FORECAST_URL)
        Alamofire.request(FORECAST_URL).responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject>{
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>]{

                    for obj in list{
                        let forecast = Forecast(weatherDict:obj)
                        self.forecasts.append(forecast)
                        print(obj)
                    }
                    self.forecasts.remove(at: 0)
                    self.tableView.reloadData()
                }
            }
            completed()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherCell {
            
            let forecast = forecasts[indexPath.row]
            cell.configureCell(forecast: forecast)
            return cell
        }
        else
        {
          return UITableViewCell()
        }
    }
    
    func updateUI()
    {
        dateLabel.text = currentWeather.date
        currentTempLabel.text = "\(currentWeather.currentTemp)"
        locationLabel.text = currentWeather.cityName
        currentWeatherTypeLabel.text = currentWeather.weatherType
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
    }
}

