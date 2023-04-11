//
//  UserDefaultsHelper.swift
//  WeatherApp
//
//  Created by Сергей Юханов on 07.04.2023.
//

import UIKit

final class UserDefaultsHelper {
    
    static var getAllWeather: [Weather]? {
        if let objects = UserDefaults.standard.value(forKey: "weather") as? Data {
            let decoder = JSONDecoder()
            if let objectsDecoded = try? decoder.decode([Weather].self, from: objects) {
                return objectsDecoded
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
    
    static var getNewWeather: [Weather]? {
        if let objects = UserDefaults.standard.value(forKey: "newWeather") as? Data {
            let decoder = JSONDecoder()
            if let objectsDecoded = try? decoder.decode([Weather].self, from: objects) {
                return objectsDecoded
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
    
    
    static func saveAllWeather(allObjects: [Weather]) -> Bool {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(allObjects) {
            UserDefaults.standard.set(encoded, forKey: "weather")
            print("saved")
            return UserDefaults.standard.synchronize()
        }
        return false
    }
    
    static func saveNewWeather(allObjects: [Weather]) -> Bool {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(allObjects) {
            UserDefaults.standard.set(encoded, forKey: "newWeather")
            print("saved")
            return UserDefaults.standard.synchronize()
        }
        return false
    }
    
    static func removeAllWeather() {
        UserDefaults.standard.removeObject(forKey: "weather")
    }
    
  
    
//    static func saveAllDrinks(allObjects: [Drink]) {
//        let encoder = JSONEncoder()
//        if let encoded = try? encoder.encode(allObjects) {
//            UserDefaults.standard.set(encoded,
//                                      forKey: "drinks")
//        }
//    }
//
    static func removeAllDrinks() {
        UserDefaults.standard.removeObject(forKey: "drinks")
    }
}
