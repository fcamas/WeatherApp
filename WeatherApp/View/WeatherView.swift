//
//  SearchWeatherCoordinator.swift
//  WeatherApp
//
//  Created by Fredy Camas on 9/17/24.
//

import SwiftUI
import CoreLocation

struct WeatherView: View {
    @ObservedObject var viewModel: WeatherViewModel
    @State private var city: String = ""
    @State private var locationManager: LocationManager?
    @State private var showSearchPrompt: Bool = false
    @State private var isCelsius: Bool = true
    
    // Initialize with the view model.
    init(viewModel: WeatherViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter city", text: $city, onCommit: {
                    fetchWeather(for: city)
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.leading, 8)
                
                Button(action: {
                    fetchWeather(for: city)
                }) {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.blue)
                }
                .padding(.leading, 8)
            }
            .padding(.horizontal)
            
            Button(action: {
                locationManager = LocationManager(weatherViewModel: viewModel)
            }) {
                Text("Use Current Location")
            }
            .padding(.top, 8)
            
            if let weather = viewModel.weather {
                WeatherRow(weather: weather, isCelsius: isCelsius)
                
                // Button to toggle between Celsius and Fahrenheit
                Button(action: {
                    isCelsius.toggle()
                }) {
                    Text(isCelsius ? "Switch to °F" : "Switch to °C")
                        .padding(.top, 8)
                }
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
        }
        .padding()
        .onAppear {
            loadLastSearchedCity()
        }
    }
    
    private func fetchWeather(for city: String) {
        viewModel.fetchWeather(for: city)
    }
    
    private func loadLastSearchedCity() {
        if let lastSearchedCity = UserDefaults.standard.string(forKey: "lastSearchedCity") {
            fetchWeather(for: lastSearchedCity)
        }
    }
}
