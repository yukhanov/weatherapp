//
//  CurrentCell.swift
//  WeatherApp
//
//  Created by Сергей Юханов on 20.03.2023.
//

import UIKit

class CurrentCell: UITableViewCell {
    
    static let identifier = "CurrentCell"
    
    private let cityNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let minTempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let maxTempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let localTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ model: Weather) {
        cityNameLabel.text = model.name
//        nameOfCoinLabel.text = model.name
//        costLabel.text = String(format: "%.2f", model.marketData.priceUSD) + "$"
//        changeInValueLabel.text = String(format: "%.2f", model.marketData.percentChange24Hours) + "%"
    }

    
    func layout() {
        [cityNameLabel, minTempLabel, tempLabel, descriptionLabel, maxTempLabel, localTimeLabel].forEach { contentView.addSubview($0) }
        

        NSLayoutConstraint.activate([
            cityNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            cityNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
         
     
        ])
        NSLayoutConstraint.activate([
            minTempLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            minTempLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
        
  
        ])
        NSLayoutConstraint.activate([
            tempLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            tempLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
