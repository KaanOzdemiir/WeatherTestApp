//
//  WindData.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 3.10.2020.
//

import Foundation
import ObjectMapper

// MARK: - WindData
class WindData: Mappable {
    var speed: Double?
    var deg: Int?

    init(
        speed: Double? = nil,
        deg: Int? = nil
    ) {
        self.speed = speed
        self.deg = deg
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        speed <- map["speed"]
        speed <- map["speed"]
    }
}
