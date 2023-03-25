//
//  ViewController.swift
//  WeatherApp
//
//  Created by Сергей Юханов on 10.03.2023.
//

import UIKit

class CityViewController: UIViewController, Coordinating {
    var cityWeather: [Weather] = []
    
    var coordinator: Coordinator?
    let cityViewModel = CityViewModel()
    
// MARK: - init UIElements
    private lazy var cityTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "enter city"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.4483243227, green: 0.4869917035, blue: 0.5389755964, alpha: 1)
        textField.layer.cornerRadius = 20
        textField.setLeftPaddingPoints(10)
        textField.setRightPaddingPoints(10)
        return textField
    }()
    
    private lazy var getWeatherButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get weather", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(getWeatherButtonTapped), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
   
        title = "Weather App"
        
        setViews()
        setConstraints()
       
    }
    
    @objc func getWeatherButtonTapped() {
        if let cityName = cityTextField.text {
            if cityTextField.text?.count != 0 {
                cityViewModel.getData(for: cityName)
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    self.coordinator?.eventOccured(with: .showCurrentVC(self.cityViewModel.weatherByCity[0]))
                }
                
            }
            
        } else {
            print("enter city")
        }
        
    }
}

extension CityViewController: ViewConfigurable {
    func setViews() {
        view.addSubview(cityTextField)
        view.addSubview(getWeatherButton)
    }
    
    func setConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            cityTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 40),
            cityTextField.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 50),
            cityTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -40),
            cityTextField.heightAnchor.constraint(equalToConstant: 50),
            
            getWeatherButton.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: 40),
            getWeatherButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getWeatherButton.heightAnchor.constraint(equalToConstant: 50),
            getWeatherButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    
}
