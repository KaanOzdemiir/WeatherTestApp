//
//  CityData.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 28.09.2020.
//

import Foundation
import ObjectMapper

// MARK: - CityData
class CityData: Mappable{
    var coordinateData: CoordinateData = CoordinateData()
    var country: String = ""
    var id: Int = 0
    var name: String = ""
    var state: String = ""
    
    var isSelected: Bool = false

    init(
        coord: CoordinateData = CoordinateData(),
        country: String = "",
        id: Int = 0,
        name: String = "",
        state: String = "",
        isSelected: Bool = false
    ) {
        self.coordinateData = coord
        self.country = country
        self.id = id
        self.name = name
        self.state = state
        self.isSelected = isSelected
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        coordinateData <- map["coord"]
        country <- map["country"]
        id <- map["id"]
        name <- map["name"]
        state <- map["state"]
    }
}

// MARK: - CoordinateData
class CoordinateData: Mappable {
    var lat: Double = -1.0
    var lon: Double = -1.0

    init(
        lat: Double = -1.0,
        lon: Double = -1.0
    ) {
        self.lat = lat
        self.lon = lon
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        lat <- map["lat"]
        lon <- map["lon"]
    }
}
