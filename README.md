# Weather App

## Table of Contents

1. [API Setup](#api-setup)
2. [Overview](#overview)
3. [Product Spec](#product-spec)
4. [Wireframes](#wireframes)
5. [Schema](#schema)

## API Setup

To get started, you will need to set up your API key from OpenWeatherMap and add it to your project. Follow these steps:

1. **Obtain API Key:**
   - Go to [OpenWeatherMap](https://openweathermap.org/api) and sign up for an account.
   - Navigate to the API section and generate an API key.

2. **Add the API Key to the App:**
   - Open your `AppDelegate.swift` file.
   - Locate the `didFinishLaunchingWithOptions` method.
   - Add your API key inside the function like this:

```swift
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Add your API key here. Replace "API_KEY_HERE" with your actual key.
        let apiKey = "API_KEY_HERE"
        Config.shared.saveApiKey(apiKey)
        return true
    }

    // Remaining app lifecycle methods...
}

## Overview

### Description

This Weather App allows users to get real-time weather information by searching for a city or by using their current location. Users can see detailed weather conditions, including temperature, humidity, and weather descriptions. The app utilizes the OpenWeatherMap API to fetch current weather data and is built with a simple, intuitive interface for ease of use.

### App Evaluation

- **Category:** Weather
- **Mobile:** Yes, available for both iOS and Android platforms.
- **Story:** The app helps users quickly retrieve accurate weather information for any US city or their current location.
- **Market:** It's for anyone who wants to check the weather, whether for daily use or travel purposes.
- **Habit:** Likely to be used multiple times daily to check weather updates for different locations.
- **Scope:** It is a straightforward weather app but offers features like location-based weather and cached city searches for convenience.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [x] User can search for the weather by entering a US city.
- [x] The app automatically loads the last searched city on launch.
- [x] User can request weather data for their current location (after granting location permissions).
- [x] User can view basic weather information such as temperature, humidity, and weather description.
- [x] Weather data is cached and loaded from the last searched city if no new data is fetched.
  
**Optional Nice-to-have Stories**

- [ ] User can see weather forecasts for the next few days.
- [ ] User can toggle between Fahrenheit and Celsius units.
- [ ] User receives push notifications for extreme weather alerts.
- [ ] User can view an hourly forecast for the day.

### 2. Screen Archetypes

- [x] **Main Screen**
  * User can search for weather by city name.
  * Displays the current weather for the last searched city or user’s current location.
  * Option to use the current location button to get weather based on GPS coordinates.
  
- [x] **Search Screen**
  * A search bar allows the user to enter and search for weather by city name.
  
- [ ] **Settings Screen**
  * Optional settings for the user to customize temperature units, location permissions, etc.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

- [x] **Weather Tab**: Main Screen (displays weather data)
- [ ] **Settings Tab**: Settings Screen (optional)

**Flow Navigation** (Screen to Screen)

- [ ] [**Main Screen**]
  * Leads to [**Settings Screen**] for modifying app settings like temperature units or notifications.

## Wireframes

### Digital Wireframes & Mockups

#### Main Screen
![Main Screen](URL-to-image)

#### Search Screen
![Search Screen](URL-to-image)

#### Settings Screen (Optional)
![Settings Screen](URL-to-image)

### Interactive Prototype

<div>
    <a href="URL-to-prototype">
      <img style="max-width:300px;" src="URL-to-thumbnail">
    </a>
</div>

## Schema

### Models

[Model Name: Weather]  
| Property     | Type     | Description                                  |
|--------------|----------|----------------------------------------------|
| city         | String   | Name of the city for which weather is fetched|
| temperature  | Float    | Current temperature                         |
| humidity     | Int      | Current humidity level                      |
| description  | String   | Description of weather conditions            |
| icon         | String   | Weather icon name to display the weather type|

### Networking

- **Weather Data:**
  - [GET] `/weather?q={city}` - Fetches weather information for a specific city.
  - [GET] `/weather?lat={lat}&lon={lon}` - Fetches weather information based on latitude and longitude (for current location).
  
- **Image Caching:**
  - Cached weather icons/images to minimize data usage and improve performance.
