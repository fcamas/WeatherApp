//
//  SearchWeatherCoordinator.swift
//  WeatherApp
//
//  Created by Fredy Camas on 9/17/24.
//

import XCTest
@testable import WeatherApp

class WeatherViewModelTests: XCTestCase {
    var viewModel: WeatherViewModel!
    var mockWeatherService: MockWeatherService!

    override func setUp() {
        super.setUp()
        mockWeatherService = MockWeatherService()
        viewModel = WeatherViewModel(weatherService: mockWeatherService)
    }

    override func tearDown() {
        viewModel = nil
        mockWeatherService = nil
        super.tearDown()
    }

    func testFetchWeatherSuccess() {
        let expectedWeather = Weather(main: .init(temp: 22.0),
                                      weather: [.init(description: "clear sky", icon: "01d")],
                                      name: "San Francisco")
        mockWeatherService.mockWeather = expectedWeather

        let expectation = self.expectation(description: "Fetching weather should succeed")
        viewModel.fetchWeather(for: "San Francisco")

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertNotNil(self.viewModel.weather)
            XCTAssertEqual(self.viewModel.weather?.name, "San Francisco")
            XCTAssertEqual(self.viewModel.weather?.main.temp, 22.0)
            XCTAssertEqual(self.viewModel.weather?.weather.first?.description, "clear sky")
            XCTAssertNil(self.viewModel.errorMessage)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testFetchWeatherFailure() {
        mockWeatherService.shouldReturnError = true
        
        let expectation = self.expectation(description: "Fetching weather should fail")
        viewModel.fetchWeather(for: "InvalidCity")

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertNil(self.viewModel.weather)
            XCTAssertNotNil(self.viewModel.errorMessage)
            XCTAssertEqual(self.viewModel.errorMessage, "Failed to fetch weather data.")
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1.0, handler: nil)
    }
}
