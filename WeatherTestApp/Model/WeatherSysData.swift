//
//  WeatherSysData.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 3.10.2020.
//

import Foundation
import ObjectMapper

// MARK: - WeatherSysData
class WeatherSysData: Mappable {
    var type, id: Int?
    var country: String?
    var sunrise, sunset: Int?

    init(
        type: Int? = nil,
        id: Int? = nil,
        country: String? = nil,
        sunrise: Int? = nil,
        sunset: Int? = nil
    ) {
        self.type = type
        self.id = id
        self.country = country
        self.sunrise = sunrise
        self.sunset = sunset
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        type <- map["type"]
        id <- map["id"]
        country <- map["country"]
        sunrise <- map["sunrise"]
        
        sunset <- map["sunset"]
    }
}
