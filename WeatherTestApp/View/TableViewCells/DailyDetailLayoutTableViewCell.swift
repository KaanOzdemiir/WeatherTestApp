//
//  DailyDetailLayoutTableViewCell.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 28.09.2020.
//

import UIKit

class DailyDetailLayoutTableViewCell: UITableViewCell {

    static var identifier = "DailyDetailLayoutTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var windTitleLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    
    @IBOutlet weak var visibilityTitleLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    
    @IBOutlet weak var moistureTitleLabel: UILabel!
    @IBOutlet weak var moistureLabel: UILabel!
    
    @IBOutlet weak var UVTitleLabel: UILabel!
    @IBOutlet weak var UVLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
}
