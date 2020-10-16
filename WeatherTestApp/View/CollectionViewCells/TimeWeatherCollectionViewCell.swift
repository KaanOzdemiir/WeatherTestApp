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

    func setCell(with data: ForecastData) {
        
        
        
        timeLabel.text = data.dt?.toDateString(format: "HH:mm")
        weatherImageView.image = #imageLiteral(resourceName: "ic_sun")
        
    }
}
