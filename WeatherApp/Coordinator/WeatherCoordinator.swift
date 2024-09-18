//
//  SearchWeatherCoordinator.swift
//  WeatherApp
//
//  Created by Fredy Camas on 9/17/24.
//

import UIKit
import SwiftUI

class WeatherCoordinator {
    private let navigationController: UINavigationController
    private let weatherService: WeatherServiceProtocol

    // Initialize with the navigation controller and weather service.
    init(navigationController: UINavigationController, weatherService: WeatherServiceProtocol = WeatherService()) {
        self.navigationController = navigationController
        self.weatherService = weatherService
    }

    // Start the WeatherCoordinator
    func start() {
        let viewModel = WeatherViewModel(weatherService: weatherService)
        
        // Load the last searched city if available.
        if let lastSearchedCity = UserDefaults.standard.string(forKey: "lastSearchedCity") {
            viewModel.fetchWeather(for: lastSearchedCity)
        }

        // Create the WeatherView and wrap it in a UIHostingController.
        let weatherView = WeatherView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: weatherView)
        navigationController.pushViewController(hostingController, animated: true)
    }
}


