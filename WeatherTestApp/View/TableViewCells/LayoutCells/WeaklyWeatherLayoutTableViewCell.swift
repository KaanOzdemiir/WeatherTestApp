//
//  WeaklyWeatherLayoutTableViewCell.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 28.09.2020.
//

import UIKit

class WeaklyWeatherLayoutTableViewCell: UITableViewCell {

    static var identifier = "WeaklyWeatherLayoutTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.register(UINib(nibName: WeaklyWeatherTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: WeaklyWeatherTableViewCell.identifier)
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    var weaklyWeathers: [WeaklyWeatherData] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}

extension WeaklyWeatherLayoutTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weaklyWeathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeaklyWeatherTableViewCell.identifier, for: indexPath) as! WeaklyWeatherTableViewCell
        
        let weaklyWeather = weaklyWeathers[indexPath.row]
        cell.setCell(withWeaklyWeather: weaklyWeather)

        return cell
    }
    
    
}

extension WeaklyWeatherLayoutTableViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
}
