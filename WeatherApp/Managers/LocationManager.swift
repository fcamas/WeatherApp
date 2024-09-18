//
//  SearchWeatherCoordinator.swift
//  WeatherApp
//
//  Created by Fredy Camas on 9/16/24.
//

import CoreLocation
import Foundation

class LocationManager: NSObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    private let weatherViewModel: WeatherViewModel

    // Initialize with the view model.
    init(weatherViewModel: WeatherViewModel) {
        self.weatherViewModel = weatherViewModel
        super.init()
        locationManager.delegate = self
        requestLocationAccess()
        
    }

    // Request location access.
    func requestLocationAccess() {
        locationManager.requestWhenInUseAuthorization()
    }

    // Handle location authorization status changes.
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            switch manager.authorizationStatus {
            case .authorizedWhenInUse, .authorizedAlways:
                self.locationManager.requestLocation()
            case .denied, .restricted:
                self.handleLocationPermissionDenied()
            default:
                break
            }
        }
    }

    // Handle location updates.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        fetchCity(from: location)
    }

    // Handle location errors.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get user location: \(error.localizedDescription)")
    }

    // Fetch city from location coordinates.
    private func fetchCity(from location: CLLocation) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
            if let error = error {
                print("Failed to get city from coordinates: \(error.localizedDescription)")
                return
            }

            if let city = placemarks?.first?.locality {
                self?.weatherViewModel.fetchWeather(for: city)
            }
        }
    }

    // Handle the case where location services are denied or restricted.
    private func handleLocationPermissionDenied() {
        // TODO show an alert or prompt to the user.
    }
}
