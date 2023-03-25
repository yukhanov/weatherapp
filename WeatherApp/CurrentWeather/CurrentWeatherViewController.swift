//
//  CurrentWeatherViewController.swift
//  WeatherApp
//
//  Created by Сергей Юханов on 13.03.2023.
//

import UIKit

class CurrentWeatherViewController: UIViewController, Coordinating {
    var cityWeather: [Weather] = []
    
    var coordinator: Coordinator?
    let cityViewModel = CityViewModel()
    var weatherArray = [Weather]()
    let currentWeatherViewModel = CurrentWeatherViewModel()
    
    private var currentTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CurrentCell.self, forCellReuseIdentifier: CurrentCell.identifier)
        return tableView
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setViews()
        setConstraints()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            print(self.currentWeatherViewModel.currentWeatherArray)
            self.currentTableView.reloadData()
        }
        
        
    
    }
    
}


extension CurrentWeatherViewController: ViewConfigurable, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityWeather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CurrentCell.identifier, for: indexPath) as? CurrentCell else { return UITableViewCell()}
       // cell.setupCell(cityViewModel.weatherByCity[indexPath.row])
        cell.setupCell(cityWeather[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func setViews() {
        view.addSubview(currentTableView)
        currentTableView.dataSource = self
        currentTableView.delegate = self
    }
    
    func setConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            currentTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            currentTableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            currentTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            currentTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
    
    
}
