//
//  DailyWeatherDetailTableViewCell.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 28.09.2020.
//

import UIKit

class DailyWeatherDetailTableViewCell: UITableViewCell {

    static var identifier = "DailyWeatherDetailTableViewCell"
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var maxDegreeLabel: UILabel!
    @IBOutlet weak var minDegreeLabel: UILabel!
    
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        resetViews()
    }
    
    func resetViews()  {
        degreeLabel.text = nil
        maxDegreeLabel.text = nil
        minDegreeLabel.text = nil
        weatherDescriptionLabel.text = nil
        degreeLabel.text = nil
    }

    func setCell(with data: WeatherResponse?) {
        if let temp = data?.main?.temp {
            degreeLabel.text = temp.toCelcius()
        }
        
        if let tempMax = data?.main?.tempMax {
            maxDegreeLabel.text = tempMax.toCelcius()
        }
        
        if let tempMin = data?.main?.tempMin {
            minDegreeLabel.text = tempMin.toCelcius()
        }
        
        if let desc = data?.weather?.first?.weatherDescription {
            weatherDescriptionLabel.text = desc.localizedCapitalized
        }
        
        if let date = data?.dt?.toDateString() {
            dateLabel.text = date
        }
        
//            cell.weatherImageView.image = UIImage(named: "ic_\(viewModel.weatherResponse?.weather?.first?.icon ?? "")")
        
    }
    
}
