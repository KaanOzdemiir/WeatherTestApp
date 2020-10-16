//
//  ForecastCityData.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 3.10.2020.
//

import Foundation
import ObjectMapper

// MARK: - ForecastCityData
class ForecastCityData: Mappable {
    var id: Int?
    var name: String?
    var coord: CoordinateData?
    var country: String?
    var population, timezone, sunrise, sunset: Int?

    init(
        id: Int? = nil,
        name: String? = nil,
        coord: CoordinateData? = nil,
        country: String? = nil,
        population: Int? = nil,
        timezone: Int? = nil,
        sunrise: Int? = nil,
        sunset: Int? = nil
    ) {
        self.id = id
        self.name = name
        self.coord = coord
        self.country = country
        self.population = population
        self.timezone = timezone
        self.sunrise = sunrise
        self.sunset = sunset
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        coord <- map["coord"]
        country <- map["country"]
        
        population <- map["population"]
        timezone <- map["timezone"]
        sunrise <- map["sunrise"]
        sunset <- map["sunset"]
    }
}
