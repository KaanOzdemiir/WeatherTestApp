//
//  ForecastMainData.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 3.10.2020.
//

import Foundation
import ObjectMapper

// MARK: - ForecastData
class ForecastData: Mappable {
    var dt: Int?
    var main: ForecastMainData?
    var weather: [WeatherData]?
    var clouds: CloudsData?
    var wind: WindData?
    var visibility, pop: Int?
    var sys: ForecastSysData?
    var dtTxt: String?

    init(
        dt: Int? = nil,
        main: ForecastMainData? = nil,
        weather: [WeatherData]? = nil,
        clouds: CloudsData? = nil,
        wind: WindData? = nil,
        visibility: Int? = nil,
        pop: Int? = nil,
        sys: ForecastSysData? = nil,
        dtTxt: String? = nil
    ) {
        self.dt = dt
        self.main = main
        self.weather = weather
        self.clouds = clouds
        self.wind = wind
        self.visibility = visibility
        self.pop = pop
        self.sys = sys
        self.dtTxt = dtTxt
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        dt <- map["dt"]
        main <- map["main"]
        weather <- map["weather"]
        clouds <- map["clouds"]
        
        wind <- map["wind"]
        visibility <- map["visibility"]
        pop <- map["pop"]
        sys <- map["sys"]
        
        dtTxt <- map["dt_txt"]
    }
}
