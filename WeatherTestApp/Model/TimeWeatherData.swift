//
//  TimeWeatherData.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 28.09.2020.
//

import Foundation

class TimeWeatherData {
    
    var time: String
    var isCurrent: Bool
    
    init(time: String = "", isCurrent: Bool = false) {
        self.time = time
        self.isCurrent = isCurrent
    }
}
