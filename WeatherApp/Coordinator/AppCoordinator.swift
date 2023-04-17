//
//  AppCoordinator.swift
//  WeatherApp
//
//  Created by Сергей Юханов on 10.03.2023.
//

import UIKit

class AppCoordinator: Coordinator {

    
    var navigationController: UINavigationController?

    
    func start() {
        var vc: UIViewController & Coordinating = CityViewController()
        var weatherVC: UIViewController & Coordinating = WeatherViewController()
        
        vc.coordinator = self
        
        if isWeatherArrayHasData {
            navigationController?.setViewControllers([weatherVC], animated: false)
        } else {
            navigationController?.setViewControllers([vc], animated: false)
        }
        
  
        
    }
    
    func eventOccured(with type: Event) {
        switch type {
        case .showCurrentVC(let data):
            var vc: UIViewController & Coordinating = WeatherViewController()
            vc.coordinator = self
            vc.newWeather.append(contentsOf: data)
            navigationController?.setViewControllers([vc], animated: true)
        case .addNewCityVC:
            var vc: UIViewController & Coordinating = CityViewController()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: false)
            
        }


        }
    }

    



