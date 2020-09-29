//
//  AppConfig.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 29.09.2020.
//

import Foundation

struct ApplicationConfig {
    
    static var apiKey: String {
        get {
            return "b4552204826245eda9238e3d57c851aa"
        }
    }
    
    static var apiHost: String {
        get {
            return "api.openweathermap.org"
        }
    }
    
    static var citiesHost: String {
        get {
            return "weathercase-99549.firebaseio.com"
        }
    }
}
