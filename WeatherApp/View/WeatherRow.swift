//
//  SearchWeatherCoordinator.swift
//  WeatherApp
//
//  Created by Fredy Camas on 9/17/24.
//

import SwiftUI

struct WeatherRow: View {
    let weather: Weather
    
    var body: some View {
        VStack {
            // Display city name.
            Text(weather.name)
                .font(.largeTitle)
            // Display temperature.
            Text("\(weather.main.temp, specifier: "%.1f")°C")
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
}
