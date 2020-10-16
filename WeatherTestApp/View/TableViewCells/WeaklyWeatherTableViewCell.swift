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

    func setCell(with data: AvarageForeCast) {
        print("XXXXX -> ", data.dt)
        dayNameLabel.text = "\(data.dt!.getDayName()!)"
        weatherImageView.image = #imageLiteral(resourceName: "ic_sun")
        maxDegreeLabel.text = data.maxTemp?.toCelcius()
        minDegreeLabel.text = data.minTemp?.toCelcius()
    }
}
