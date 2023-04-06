//
//  Coordinator.swift
//  WeatherApp
//
//  Created by Сергей Юханов on 10.03.2023.
//

import UIKit

enum Event {
    case showCurrentVC([Weather])
}

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    
    func eventOccured(with type: Event)
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
    var weatherArray: [Weather] { get set }
  

}
