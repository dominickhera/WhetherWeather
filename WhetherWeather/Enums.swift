//
//  Enums.swift
//  WhetherWeather
//
//  Created by Dominick Hera on 9/24/18.
//  Copyright © 2018 Dominick Hera. All rights reserved.
//

import UIKit

enum unitType: String {
    case imperial = "imperial"
    case metric = "metric"
}

enum userType {
    case user
    case anonymous
}

enum callType: String {
    case cityName
    case zipCode
    case coordinates
}

protocol Path {
    var path: String { get }
}

enum requestEndpoint: String {
    case getWeatherByCityName
}

extension requestEndpoint: Path {
    var baseURL: String {
        return "api.openweathermap.org/data/2.5/weather"
    }
    var path: String {
        switch self {
        case .getWeatherByCityName: return "\(baseURL)"
        }
    }
}
