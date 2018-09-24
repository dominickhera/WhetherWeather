//
//  savedLocation.swift
//  WhetherWeather
//
//  Created by Dominick Hera on 9/24/18.
//  Copyright © 2018 Dominick Hera. All rights reserved.
//

import Foundation


struct savedLocation {
    let cityName: String
    let lattitude: String
    let longitude: String
    
    init(cityName: String, lattitude: String, longitude: String) {
        self.cityName = cityName
        self.lattitude = lattitude
        self.longitude = longitude
    }
}
