//
//  WeatherViewController+TableView.swift
//  WeatherApp
//
//  Created by Сергей Юханов on 25.03.2023.
//

import UIKit

extension WeatherViewController: ViewConfigurable, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherArray.count ?? 0
        // change to viewModel func
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherCell.identifier, for: indexPath) as? WeatherCell else { return UITableViewCell()}

        cell.setupCell(weatherArray[indexPath.row])
        
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

