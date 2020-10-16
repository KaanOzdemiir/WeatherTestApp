//
//  ForecastSysData.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 3.10.2020.
//

import Foundation
import ObjectMapper

// MARK: - ForecastSysData
class ForecastSysData: Mappable {
    var pod: String?

    init(
        pod: String? = nil
    ) {
        self.pod = pod
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        pod <- map["pod"]
    }
}
