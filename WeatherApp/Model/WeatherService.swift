//
//  SearchWeatherCoordinator.swift
//  WeatherApp
//
//  Created by Fredy Camas on 9/17/24.
//

import Foundation

protocol WeatherServiceProtocol {
    func fetchWeather(for city: String) async throws -> Weather
}

class WeatherService: WeatherServiceProtocol {
    private let apiKey = Config.shared.apiKey()

    // Fetch weather data from the API using async/await.
    func fetchWeather(for city: String) async throws -> Weather {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"

        // Create URL from the string.
        guard let url = URL(string: urlString) else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        }

        // Perform network request.
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))

        // Ensure response is valid.
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid server response"])
        }

        // Decode the JSON response.
        return try JSONDecoder().decode(Weather.self, from: data)
    }
}
