//
//  Extension.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 28.09.2020.
//

import UIKit

extension String {
    var intValue: Int {
        return Int(self) ?? 0
    }
    func getWeatherImage() -> UIImage? {
        guard let date = self.toTime() else {
            return nil
        }
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        
        if hour <= 6 {
            return #imageLiteral(resourceName: "ic_sun_cloud")
        }else if hour <= 12 {
            return #imageLiteral(resourceName: "ic_sun")
        }else if hour <= 18 {
            return #imageLiteral(resourceName: "ic_cloud")
        }else if hour <= 21 {
            return #imageLiteral(resourceName: "ic_rainy")
        }
        
        return #imageLiteral(resourceName: "ic_cloudy_night")
    }
    
    func toTime() -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        let date = dateFormatter.date(from: self == "24:00" ? "23:59" : self)
        
        return date
    }
}
