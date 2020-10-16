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
    func getWeatherImageByTime() -> UIImage? {
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
    
    func getWeatherImageByWeatherType() -> UIImage? {
        switch self {
        case "rainy":
            return #imageLiteral(resourceName: "ic_rainy")
        case "sunny_rainy":
            return #imageLiteral(resourceName: "ic_sunny_rainy")
        case "torrential_rain":
            return #imageLiteral(resourceName: "ic_torrential_rain")
        case "sunny":
            return #imageLiteral(resourceName: "ic_sun")
        default:
            return nil
        }
    }
    
    func toTime() -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        let date = dateFormatter.date(from: self == "24:00" ? "23:59" : self)
        
        return date
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }
}

extension Int {
    var timeInterval: TimeInterval {
        return TimeInterval(self)
    }
    
    func toDateString(format: String = "dd/MM/YYYY") -> String? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "tr")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 10800) ?? TimeZone.current

        let date = Date(timeIntervalSince1970: self.timeInterval)
        let dateString = dateFormatter.string(from: date)
        
        return dateString
    }
    
    func getDayName() -> String? {
        let date = Date(timeIntervalSince1970: self.timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 10800) ?? TimeZone.current
        dateFormatter.dateFormat = "EEEE"
        let dayInWeek = dateFormatter.string(from: date)
        return dayInWeek
    }
}

extension Double {
    func toCelcius() -> String {
        return String(format: "%.0f", self - 273.15) + "°C"
    }
}

extension Date {
    var now: TimeInterval {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(secondsFromGMT: 10800) ?? TimeZone.current
        let date = calendar.date(byAdding: .day, value: 0, to: self)!
        return Int(date.timeIntervalSince1970).timeInterval
    }
    var todayBeginingTimeStamp: TimeInterval { // OR: 15.04.2020 00:00:00
        let date = Date()
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(secondsFromGMT: 10800) ?? TimeZone.current
        let startTime = calendar.startOfDay(for: date)
        
        return startTime.timeIntervalSince1970
    }
    
    var todayEndTimeStamp: TimeInterval { // OR: 15.04.2020 23:59:59
        let date = Date()
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(secondsFromGMT: 10800) ?? TimeZone.current
        let endTime = calendar.date(bySettingHour: 23, minute: 59, second: 59, of: date)

        return endTime!.timeIntervalSince1970
    }
    
    func xDayAgoEndTimeStamp(_ index: Int) -> TimeInterval {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(secondsFromGMT: 10800) ?? TimeZone.current
        let date = calendar.date(byAdding: .day, value: -index, to: self)!
        let endTime = calendar.date(bySettingHour: 23, minute: 59, second: 59, of: date)

        return endTime!.timeIntervalSince1970
    }
}
