//
//  CurrentWeatherViewController.swift
//  WeatherApp
//
//  Created by Сергей Юханов on 13.03.2023.
//

import UIKit

class WeatherViewController: UIViewController, Coordinating {
    
    var weatherArray = [Weather]()
    
    var coordinator: Coordinator?
    let weatherViewModel = WeatherViewModel()
    let cityViewModel = CityViewModel()


    
    var currentTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(WeatherCell.self, forCellReuseIdentifier: WeatherCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setViews()
        setConstraints()
        
        print(weatherArray)
    
        
        weatherViewModel.addWeatherToArray(tableView: currentTableView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.currentTableView.reloadData()
        }
        
        
        
    }
    
}


