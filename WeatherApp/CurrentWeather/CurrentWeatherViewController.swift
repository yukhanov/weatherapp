//
//  CurrentWeatherViewController.swift
//  WeatherApp
//
//  Created by Сергей Юханов on 13.03.2023.
//

import UIKit

class CurrentWeatherViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    private var currentTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setViews()
        setConstraints()
    }
    
}


extension CurrentWeatherViewController: ViewConfigurable, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func setViews() {
        view.addSubview(currentTableView)
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
