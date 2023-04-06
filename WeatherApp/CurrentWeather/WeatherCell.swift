//
//  CurrentCell.swift
//  WeatherApp
//
//  Created by Сергей Юханов on 20.03.2023.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    static let identifier = "CurrentCell"
    
    private let cityNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 22)
        
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
        label.font = UIFont.boldSystemFont(ofSize: 44)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layout()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ model: Weather, indexPath: IndexPath) {
        cityNameLabel.text = model.name
        tempLabel.text = String(format: "%.0f°", ((model.main?.temp ?? 0) - 273.15))
        minTempLabel.text = String(format: "min: %.0f°", ((model.main?.tempMin ?? 0) - 273.15))
        maxTempLabel.text = String(format: "max: %.0f°", ((model.main?.tempMax ?? 0) - 273.15))
        descriptionLabel.text = model.weather[indexPath.row]?.main
        
        let unixTimestamp: Int? = model.dt

        if let timestamp = unixTimestamp {
            let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
            let dateFormatter = DateFormatter()
            dateFormatter.timeZone = TimeZone(secondsFromGMT: model.timezone ?? 0)
            dateFormatter.dateFormat = "HH:mm"
            let formattedDate = dateFormatter.string(from: date)
            localTimeLabel.text = formattedDate
        } else {
            print("Unix timestamp is nil.")
        }
        
    

    }

    
    func layout() {
        [cityNameLabel, minTempLabel, tempLabel, descriptionLabel, maxTempLabel, localTimeLabel].forEach { contentView.addSubview($0) }
        

        NSLayoutConstraint.activate([
            cityNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            cityNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            localTimeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            localTimeLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 3)
        ])
        
        NSLayoutConstraint.activate([
            minTempLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            minTempLabel.trailingAnchor.constraint(equalTo: maxTempLabel.leadingAnchor, constant: -5),
        ])
        NSLayoutConstraint.activate([
            maxTempLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            maxTempLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
        NSLayoutConstraint.activate([
            tempLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            tempLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
}
