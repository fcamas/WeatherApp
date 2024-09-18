//
//  SearchWeatherCoordinator.swift
//  WeatherApp
//
//  Created by Fredy Camas on 9/17/24.
//

import UIKit

class AppCoordinator {
    private let window: UIWindow
    private let navigationController: UINavigationController

    // Initialize with the main window.
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    // Start the app by showing the Weather view.
    func start() {
        let weatherCoordinator = WeatherCoordinator(navigationController: navigationController)
        weatherCoordinator.start()
    }
}
