//
//  WeatherData.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 3.10.2020.
//

import Foundation
import ObjectMapper

// MARK: - WeatherData
class WeatherData: Mappable {
    var id: Int?
    var main, weatherDescription, icon: String?
    
    init(
        id: Int? = nil,
        main: String? = nil,
        weatherDescription: String? = nil,
        icon: String? = nil
    ) {
        self.id = id
        self.main = main
        self.weatherDescription = weatherDescription
        self.icon = icon
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        main <- map["main"]
        weatherDescription <- map["description"]
        icon <- map["icon"]
    }
}
