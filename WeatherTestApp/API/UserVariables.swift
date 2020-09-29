//
//  CustomerVariables.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 29.09.2020.
//

import Foundation

class UserVariables {
    
    static let defaults = UserDefaults.standard
    
    static var selectedCitiesJSONString: String {
        set {
            defaults.setValue(newValue, forKey: "SELECTED_CITIES_JSON_STRING")
            defaults.synchronize()
        }
        get {
            return defaults.string(forKey: "SELECTED_CITIES_JSON_STRING") ?? ""
        }
    }
}
