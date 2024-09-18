//
//  SearchWeatherCoordinator.swift
//  WeatherApp
//
//  Created by Fredy Camas on 9/17/24.
//

import Foundation

struct Weather: Codable {
    let main: Main
    let weather: [WeatherCondition]
    let name: String

    struct Main: Codable {
        let temp: Double
    }

    struct WeatherCondition: Codable {
        let description: String
        let icon: String
    }
}
