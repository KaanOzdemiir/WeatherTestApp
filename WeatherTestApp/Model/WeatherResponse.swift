//
//  WeatherResponse.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 29.09.2020.
//

import Foundation
import ObjectMapper

// MARK: - WeatherResponse
class WeatherResponse: Mappable {
    var coord: CoordinateData?
    var weather: [WeatherData]?
    var base: String?
    var main: WeatherMainData?
    var visibility: Int?
    var wind: WindData?
    var clouds: CloudsData?
    var dt: Int?
    var sys: WeatherSysData?
    var timezone: Int?
    var id: Int?
    var name: String?
    var cod: Int?

    init(
        coord: CoordinateData? = nil,
        weather: [WeatherData]? = nil,
        base: String? = nil,
        main: WeatherMainData? = nil,
        visibility: Int? = nil,
        wind: WindData? = nil,
        clouds: CloudsData? = nil,
        dt: Int? = nil,
        sys: WeatherSysData? = nil,
        timezone: Int? = nil,
        id: Int? = nil,
        name: String? = nil,
        cod: Int? = nil
    ) {
        self.coord = coord
        self.weather = weather
        self.base = base
        self.main = main
        self.visibility = visibility
        self.wind = wind
        self.clouds = clouds
        self.dt = dt
        self.sys = sys
        self.timezone = timezone
        self.id = id
        self.name = name
        self.cod = cod
    }
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        coord <- map["coord"]
        weather <- map["weather"]
        base <- map["base"]
        main <- map["main"]
        
        visibility <- map["visibility"]
        wind <- map["wind"]
        clouds <- map["clouds"]
        dt <- map["dt"]
        
        sys <- map["sys"]
        timezone <- map["timezone"]
        id <- map["id"]
        name <- map["name"]
        
        cod <- map["cod"]
    }
}
