//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Fredy Camas on 9/17/24.
//

import Foundation

class Config {
    static let shared = Config()
    
    private let apiKeyKey = "API_KEY"

    func apiKey() -> String {
        if let apiKey = KeychainWrapper.load(key: apiKeyKey) {
            return apiKey
        } else {
            fatalError("API_KEY not found in Keychain")
        }
    }
    
    func saveApiKey(_ apiKey: String) {
        if !KeychainWrapper.save(key: apiKeyKey, data: apiKey) {
            fatalError("Failed to save API_KEY to Keychain")
        }
    }
}
