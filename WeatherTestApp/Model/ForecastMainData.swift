//
//  ForecastMainData.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 3.10.2020.
//

import Foundation
import ObjectMapper

// MARK: - ForecastMainData
class ForecastMainData: Mappable {
    var temp, feelsLike, tempMin, tempMax: Double?
    var pressure, seaLevel, grndLevel, humidity: Int?
    var tempKf: Double?

    init(
        temp: Double? = nil,
        feelsLike: Double? = nil,
        tempMin: Double? = nil,
        tempMax: Double? = nil,
        pressure: Int? = nil,
        seaLevel: Int? = nil,
        grndLevel: Int? = nil,
        humidity: Int? = nil,
        tempKf: Double? = nil
    ) {
        self.temp = temp
        self.feelsLike = feelsLike
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.pressure = pressure
        self.seaLevel = seaLevel
        self.grndLevel = grndLevel
        self.humidity = humidity
        self.tempKf = tempKf
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        temp <- map["temp"]
        feelsLike <- map["feels_like"]
        tempMin <- map["temp_min"]
        tempMax <- map["temp_max"]
        
        pressure <- map["pressure"]
        seaLevel <- map["sea_level"]
        grndLevel <- map["grnd_level"]
        humidity <- map["humidity"]
        
        tempKf <- map["temp_kf"]
    }
}
