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
    
    var timeWeathers: [TimeWeatherData] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}

extension TimeWeatherLayoutTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timeWeathers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeWeatherCollectionViewCell.identifier, for: indexPath) as! TimeWeatherCollectionViewCell
        
        let timeWeather = timeWeathers[indexPath.item]
        cell.setCell(withTimeWeather: timeWeather)
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
