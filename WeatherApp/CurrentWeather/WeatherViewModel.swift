//
//  CurrentWeatherViewModel.swift
//  WeatherApp
//
//  Created by Сергей Юханов on 13.03.2023.
//

import UIKit

class WeatherViewModel {
    
    
  
    let userDefaults = UserDefaults.standard
    
    func saveData(to weatherArray: [Weather]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(weatherArray) {
            // Сохранение Data в UserDefaults
            UserDefaults.standard.set(encoded, forKey: "weather")
        }
    }
    
    func getData(to weatherArray: inout [Weather]) {
        // Извлечение Data из UserDefaults
        if let data = UserDefaults.standard.data(forKey: "weather") {
            // Десериализация Data в массив [Weather]
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Weather].self, from: data) {
                // Использование массива [Weather]
                print(decoded)
                weatherArray = decoded // Заменяем содержимое weatherArray декодированным массивом
            }
        }
    }

   
    
    
    
}


    

