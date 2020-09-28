//
//  WeaklyWeatherTableViewCell.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 28.09.2020.
//

import UIKit

class WeaklyWeatherTableViewCell: UITableViewCell {

    static var identifier = "WeaklyWeatherTableViewCell"
    
    @IBOutlet weak var dayNameLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var maxDegreeLabel: UILabel!
    @IBOutlet weak var minDegreeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCell(withWeaklyWeather weaklyWeather: WeaklyWeatherData) {
        dayNameLabel.text = weaklyWeather.dayName
        weatherImageView.image = weaklyWeather.weatherType.getWeatherImageByWeatherType()
        maxDegreeLabel.text = "\(weaklyWeather.maxDegree)°"
        minDegreeLabel.text = "\(weaklyWeather.minDegree)°"
    }
}
