//
//  WeatherDetailViewController.swift
//  Weather
//
//  Created by Heli Bavishi on 11/18/20.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    var city: TopLevelDictionary?
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        self.title = city?.name
    }
    
    func updateView() {
        guard let city = city else { return }
        self.cityNameLabel.text = "City Name is \(city.name)"
        self.descriptionLabel.text = "Weather is \(city.weather[0].description)"
        self.tempLabel.text = "Current Tempurature is \(city.main.temp)"
        self.humidityLabel.text = "Humidity is \(city.main.humidity)"
        self.windLabel.text = "Wind is \(city.wind.speed)"
    }
    
}//END of class
