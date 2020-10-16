//
//  CityTableViewCell.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 29.09.2020.
//

import UIKit

class AddCityTableViewCell: UITableViewCell {
    
    static var identifier = "AddCityTableViewCell"

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var addButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
