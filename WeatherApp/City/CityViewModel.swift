//
//  CityViewModel.swift
//  WeatherApp
//
//  Created by Сергей Юханов on 11.03.2023.
//

import UIKit


class CityViewModel {

    let networkManager = NetworkService()
    var isLoading: Observable<Bool> = Observable(false)
    var dataSource = Dynamic(value: [Weather]())
    
    func getData(for city: String) {
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        networkManager.getWeather(for: city) { [weak self] result in
            self?.isLoading.value = false
            
            switch result {
            case .success(let data):
                        self?.dataSource.value = data!
                        print("Its data\(data)")
                        print("Its datasource: \(self?.dataSource.value)")
                    
            
               
                
            case .failure(let error):
                print(error)
            }
    
            
        }
        
    }
    
   
    
}
