//
//  CityCollectionViewCell.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 28.09.2020.
//

import UIKit

class CityCollectionViewCell: UICollectionViewCell {

    static var identifier = "CityCollectionViewCell"
    
    @IBOutlet weak var cityNameContainerView: UIView!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(withCity city: CityData) {
        cityNameContainerView.backgroundColor = city.isSelected ? #colorLiteral(red: 0.4930396676, green: 0.3013834357, blue: 0.9637102485, alpha: 1) : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        cityNameLabel.textColor = city.isSelected ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.3176470588, green: 0.3411764706, blue: 0.4117647059, alpha: 1)
        cityNameLabel.text = city.name
    }

}
