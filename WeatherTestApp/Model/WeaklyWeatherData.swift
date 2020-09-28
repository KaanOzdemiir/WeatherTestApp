//
//  WeaklyWeatherData.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 28.09.2020.
//

import Foundation

class WeaklyWeatherData {
    var dayName: String
    var weatherType: String
    var maxDegree: Int
    var minDegree: Int
    
    init(
        dayName: String = "",
        weatherType: String = "",
        maxDegree: Int = 0,
        minDegree: Int = 0
    ) {
        self.dayName = dayName
        self.weatherType = weatherType
        self.maxDegree = maxDegree
        self.minDegree = minDegree
    }
}
