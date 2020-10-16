//
//  CityWeatherForecastResponse.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 3.10.2020.
//

import Foundation
import ObjectMapper

// MARK: - ForecastResponse
class ForecastResponse: Mappable {
    var cod: String?
    var message, cnt: Int?
    var forcastList: [ForecastData]?
    var city: ForecastCityData?

    init(
        cod: String? = nil,
        message: Int? = nil,
        cnt: Int? = nil,
        list: [ForecastData]? = nil,
        city: ForecastCityData? = nil
    ) {
        self.cod = cod
        self.message = message
        self.cnt = cnt
        self.forcastList = list
        self.city = city
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        cod <- map["cod"]
        message <- map["message"]
        cnt <- map["cnt"]
        forcastList <- map["list"]
        forcastList?.sort(by: {$0.dt ?? 0 > $1.dt ?? 0})
        city <- map["city"]
    }
    
    func getCurrentForecast() -> ForecastData? {
        let now = Date().timeIntervalSince1970
        let currentForecast = self.forcastList?.first(where: {$0.dt!.timeInterval > now})
        return currentForecast
    }
}
