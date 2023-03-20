//
//  CityViewModel.swift
//  WeatherApp
//
//  Created by Сергей Юханов on 11.03.2023.
//

import Foundation


class CityViewModel {
    let networkManager = NetworkService()
    
    var weatherByCity = [Weather]()
//
//    init(weatherByCity: [Weather]) {
//        self.weatherByCity = weatherByCity
//    }
    
    func getData(for city: String) {
        networkManager.getWeather(for: city) { result in
            switch result {
            case .success(let data):
                self.weatherByCity = data!
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
}
