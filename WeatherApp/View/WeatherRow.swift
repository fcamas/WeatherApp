//
//  SearchWeatherCoordinator.swift
//  WeatherApp
//
//  Created by Fredy Camas on 9/17/24.
//

import SwiftUI

struct WeatherRow: View {
    let weather: Weather
    let isCelsius: Bool
    
    var body: some View {
        VStack {
            // Display city name.
            Text(weather.name)
                .font(.largeTitle)
            
            // Display temperature in either Celsius or Fahrenheit.
            Text(formatTemperature(weather.main.temp, isCelsius: isCelsius))
                .font(.title)
            
            // Display weather description.
            Text(weather.weather.first?.description.capitalized ?? "")
            
            // Display weather icon.
            AsyncImage(url: URL(string: "https://openweathermap.org/img/w/\(weather.weather.first?.icon ?? "").png")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
            } placeholder: {
                ProgressView()
            }
        }
    }
    
    // Function to format temperature between Celsius and Fahrenheit.
    private func formatTemperature(_ temp: Double, isCelsius: Bool) -> String {
        if isCelsius {
            return String(format: "%.1f°C", temp)
        } else {
            let fahrenheitTemp = (temp * 9 / 5) + 32
            return String(format: "%.1f°F", fahrenheitTemp)
        }
    }
}
