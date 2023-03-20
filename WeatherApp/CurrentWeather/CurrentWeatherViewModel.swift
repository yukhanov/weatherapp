//
//  CurrentWeatherViewModel.swift
//  WeatherApp
//
//  Created by Сергей Юханов on 13.03.2023.
//

import Foundation

class CurrentWeatherViewModel {
    let currentWeatherArray: [Weather] = CityViewModel().weatherByCity
    
    func showCurrentWeather() {
        currentWeatherArray[0].main?.temp
    }
}
