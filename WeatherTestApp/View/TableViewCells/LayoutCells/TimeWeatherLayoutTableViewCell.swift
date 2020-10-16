//
//  TimeWeatherLayoutTableViewCell.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 28.09.2020.
//

import UIKit

class TimeWeatherLayoutTableViewCell: UITableViewCell {

    static var identifier = "TimeWeatherLayoutTableViewCell"
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.register(UINib(nibName: TimeWeatherCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: TimeWeatherCollectionViewCell.identifier)
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    var todayWeatherForecastByTime: [ForecastData] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}

extension TimeWeatherLayoutTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return todayWeatherForecastByTime.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeWeatherCollectionViewCell.identifier, for: indexPath) as! TimeWeatherCollectionViewCell
        
        let forecast = todayWeatherForecastByTime[indexPath.item]
        cell.setCell(with: forecast)
        if let _ = todayWeatherForecastByTime.first(where: {$0.dt!.timeInterval < Date().now}){
            cell.weatherImageViewContainerView.backgroundColor = #colorLiteral(red: 0.4930396676, green: 0.3013834357, blue: 0.9637102485, alpha: 1)
        }else{
            cell.weatherImageViewContainerView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        return cell
    }
    
    
}

extension TimeWeatherLayoutTableViewCell: UICollectionViewDelegate {
    
}

extension TimeWeatherLayoutTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: self.frame.width / 5 - 10, height: 93)
    }
}
