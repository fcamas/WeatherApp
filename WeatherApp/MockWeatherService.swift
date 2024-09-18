//
//  SearchWeatherCoordinator.swift
//  WeatherApp
//
//  Created by Fredy Camas on 9/17/24.
//
import Foundation
import CoreLocation

class MockWeatherService: WeatherServiceProtocol {
    var mockWeather: Weather?
    var shouldReturnError = false

    func fetchWeather(for city: String) async throws -> Weather {
        if shouldReturnError {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch weather data."])
        } else {
            guard let weather = mockWeather else {
                throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No mock weather data available."])
            }
            return weather
        }
    }
}
