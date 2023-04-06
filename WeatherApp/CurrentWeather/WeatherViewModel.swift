//
//  CurrentWeatherViewModel.swift
//  WeatherApp
//
//  Created by Сергей Юханов on 13.03.2023.
//

import UIKit

class WeatherViewModel {
    
    let currentWeatherArray = Dynamic(value: [Weather]())
    
   let cityViewModel = CityViewModel()
    
    
    
    

    func addWeatherToArray(tableView: UITableView) {

        cityViewModel.dataSource.bind { result in
            self.currentWeatherArray.value.append(contentsOf: result)
            print("in weatherViewModel: \(self.currentWeatherArray.value)")
        }
            tableView.reloadData()
        }



}
    

    

