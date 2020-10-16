//
//  CloudsData.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 3.10.2020.
//

import Foundation
import ObjectMapper

// MARK: - CloudsData
class CloudsData: Mappable {
    var all: Int?

    init(all: Int?) {
        self.all = all
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        all <- map["all"]
    }
}
