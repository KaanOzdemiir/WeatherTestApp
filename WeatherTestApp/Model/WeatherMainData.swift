//
//  WeatherMainData.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 3.10.2020.
//

import Foundation
import ObjectMapper

// MARK: - WeatherMainData
class WeatherMainData: Mappable {
    var temp: Double?
    var feelsLike: Int?
    var tempMin: Double?
    var tempMax: Double?
    var pressure: Int?
    var humidity: Int?

    init(
        temp: Double?,
        feelsLike: Int?,
        tempMin: Double?,
        tempMax: Double?,
        pressure: Int?,
        humidity: Int?
    ) {
        self.temp = temp
        self.feelsLike = feelsLike
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.pressure = pressure
        self.humidity = humidity
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        temp <- map["temp"]
        feelsLike <- map["feels_like"]
        tempMin <- map["temp_min"]
        tempMax <- map["temp_max"]
        
        pressure <- map["pressure"]
        humidity <- map["humidity"]
    }
}
