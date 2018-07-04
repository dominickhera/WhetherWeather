//
//  ViewController.swift
//  WhetherWeather
//
//  Created by Dominick Hera on 7/3/18.
//  Copyright © 2018 Dominick Hera. All rights reserved.
//

import UIKit
import CoreLocation
import OpenWeatherMapKit


class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager: CLLocationManager!
    
    @IBOutlet weak var weatherConditionLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
         OpenWeatherMapKit.initialize(withAppId: "b8ae01f6344f6fb00b128c10e4ffcf19")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func requestLocation(_ sender: Any) {
        var currentLocation: CLLocation!
        var currentTemp: Double!
        var weatherCondition: String!
        if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() ==  .authorizedAlways){

//            latitudeString = locationManager.location?.coordinate.latitude

            currentLocation = locationManager.location

                OpenWeatherMapKit.instance.currentWeather(forCoordiante: (latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude)) { (forecast, error) in

                currentTemp = forecast?.main.celsius.currentTemp
                    weatherCondition = forecast?.weather.description

                    DispatchQueue.main.async {
                                    self.currentTempLabel.text = "\(round(currentTemp!))"
//                            self.weatherConditionLabel.text = weatherCondition.description
                        print(weatherCondition!)
                        for item in weatherCondition! {
                            print("\(item.description)")
                        }

                    }
//                print(forecast?.main.celsius.currentTemp)
            }

        }

    }


}

