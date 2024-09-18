//
//  SearchWeatherCoordinator.swift
//  WeatherApp
//
//  Created by Fredy Camas on 9/17/24.
//

import UIKit
import SwiftUI

class WeatherViewController: UIViewController {
    private let viewModel: WeatherViewModel
    private var locationManager: LocationManager?

    init(viewModel: WeatherViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        let weatherView = WeatherView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: weatherView)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupLocationManager() {
        locationManager = LocationManager(weatherViewModel: viewModel)
    }
}
