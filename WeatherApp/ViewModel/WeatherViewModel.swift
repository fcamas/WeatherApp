//
//  SearchWeatherCoordinator.swift
//  WeatherApp
//
//  Created by Fredy Camas on 9/17/24.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    @Published var weather: Weather?
    @Published var errorMessage: String?
    private let weatherService: WeatherServiceProtocol

    // Initialize with a weather service.
    init(weatherService: WeatherServiceProtocol) {
        self.weatherService = weatherService
    }

    // Fetch weather data for the given city using async/await.
    func fetchWeather(for city: String) {
        // Save the city to UserDefaults
        UserDefaults.standard.set(city, forKey: "lastSearchedCity")

        Task {
            do {
                let weather = try await weatherService.fetchWeather(for: city)
                DispatchQueue.main.async {
                    self.weather = weather
                    self.errorMessage = nil
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}



