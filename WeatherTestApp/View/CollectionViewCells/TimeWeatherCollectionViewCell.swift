//
//  TimeWeatherCollectionViewCell.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 28.09.2020.
//

import UIKit

class TimeWeatherCollectionViewCell: UICollectionViewCell {

    static var identifier = "TimeWeatherCollectionViewCell"
    
    @IBOutlet weak var weatherImageViewContainerView: UIView!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCell(withTimeWeather timeWeather: TimeWeatherData) {
        
        weatherImageViewContainerView.backgroundColor = timeWeather.isCurrent ? #colorLiteral(red: 0.4930396676, green: 0.3013834357, blue: 0.9637102485, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        timeLabel.text = timeWeather.time
        weatherImageView.image = timeWeather.time.getWeatherImageByTime()
    }
}
