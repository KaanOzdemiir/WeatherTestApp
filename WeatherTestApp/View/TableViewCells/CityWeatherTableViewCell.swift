//
//  CityWeatherTableViewCell.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 3.10.2020.
//

import UIKit

class CityWeatherTableViewCell: UITableViewCell {

    static var identifier = "CityWeatherTableViewCell"

    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        initViews()
    }
    
    func initViews() {
        weatherImageView.image = nil
        cityNameLabel.text = nil
        dateLabel.text = nil
        tempLabel.text = nil
    }
    
    func setCell(with forecast: ForecastResponse) {
        cityNameLabel.text = forecast.city?.name
                
        let currentForecast = forecast.getCurrentForecast()
        tempLabel.text = currentForecast?.main?.temp?.toCelcius()
        dateLabel.text = currentForecast?.dt?.toDateString()
    }
    
}
