//
//  WeatherByCityModel.swift
//  WeatherApp
//
//  Created by Сергей Юханов on 12.03.2023.
//
import Foundation

struct WeatherModel {
    let weatherModel: [Weather?]
}

// MARK: - Weather
struct Weather: Codable {
    let coord: Coord?
    let weather: [WeatherElement?]
    let base: String?
    let main: Main?
    let visibility: Int?
    let dt: Int?
 
    let timezone: Int?
    let id: Int?
    let name: String?
    let cod: Int?

    enum CodingKeys: String, CodingKey {
        case coord = "coord"
        case weather = "weather"
        case base = "base"
        case main = "main"
        case visibility = "visibility"

        case dt = "dt"
   
        case timezone = "timezone"
        case id = "id"
        case name = "name"
        case cod = "cod"
    }
}


// MARK: - Coord
struct Coord: Codable {
    let lon: Double?
    let lat: Double?

    enum CodingKeys: String, CodingKey {
        case lon = "lon"
        case lat = "lat"
    }
}

// MARK: - Main
struct Main: Codable {
    let temp: Double?
    let feelsLike: Double?
    let tempMin: Double?
    let tempMax: Double?
    let pressure: Int?
    let humidity: Int?

    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure = "pressure"
        case humidity = "humidity"
    }
}



// MARK: - WeatherElement
struct WeatherElement: Codable {
    let id: Int?
    let main: String?
    let description: String?
    let icon: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case main = "main"
        case description = "description"
        case icon = "icon"
    }
}

