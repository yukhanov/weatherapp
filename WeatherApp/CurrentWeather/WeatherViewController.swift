//
//  CurrentWeatherViewController.swift
//  WeatherApp
//
//  Created by Сергей Юханов on 13.03.2023.
//

import UIKit

class WeatherViewController: UIViewController, Coordinating {
    
    var weatherArray = [Weather]()
    var newWeather = [Weather]()
    
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
        rightBarButton()
        title = "WeatherApp"
        
        getData()
        
    
        
    }
    
    func getData() {
        weatherArray = UserDefaultsHelper.getAllWeather!
        newWeather = UserDefaultsHelper.getNewWeather!
        weatherArray += newWeather
        UserDefaultsHelper.saveAllWeather(allObjects: weatherArray)
    }
    
    func saveValue(from array: [Weather]) {
        UserDefaultsHelper.saveAllWeather(allObjects: array)
    }
    
  
    

    
    func rightBarButton() {
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add,
                                             target: self,
                                             action: #selector(addNewCity))
        navigationItem.rightBarButtonItem = rightBarButton
        
    }
    
    
    
    @objc func addNewCity() {
        coordinator?.eventOccured(with: .addNewCityVC)
    }
    
}


