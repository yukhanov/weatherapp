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
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)
    }
    
    func eventOccured(with type: Event) {
        switch type {
        case .showCurrentVC(let data):
            var vc: UIViewController & Coordinating = CurrentWeatherViewController()
            vc.cityWeather.append(data)
            vc.coordinator = self
            navigationController?.setViewControllers([vc], animated: true)
        }


        }
    }

    



