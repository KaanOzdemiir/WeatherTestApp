//
//  WeatherResponse.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 29.09.2020.
//

import Foundation
import ObjectMapper

// MARK: - WeatherResponse
class WeatherResponse: Mappable {
    var coord: CoordinateData?
    var weather: [Weather]?
    var base: String?
    var main: Main?
    var visibility: Int?
    var wind: Wind?
    var clouds: Clouds?
    var dt: Int?
    var sys: Sys?
    var timezone: Int?
    var id: Int?
    var name: String?
    var cod: Int?

    init(
        coord: CoordinateData? = nil,
        weather: [Weather]? = nil,
        base: String? = nil,
        main: Main? = nil,
        visibility: Int? = nil,
        wind: Wind? = nil,
        clouds: Clouds? = nil,
        dt: Int? = nil,
        sys: Sys? = nil,
        timezone: Int? = nil,
        id: Int? = nil,
        name: String? = nil,
        cod: Int? = nil
    ) {
        self.coord = coord
        self.weather = weather
        self.base = base
        self.main = main
        self.visibility = visibility
        self.wind = wind
        self.clouds = clouds
        self.dt = dt
        self.sys = sys
        self.timezone = timezone
        self.id = id
        self.name = name
        self.cod = cod
    }
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        coord <- map["coord"]
        weather <- map["weather"]
        base <- map["base"]
        main <- map["main"]
        
        visibility <- map["visibility"]
        wind <- map["wind"]
        clouds <- map["clouds"]
        dt <- map["dt"]
        
        sys <- map["sys"]
        timezone <- map["timezone"]
        id <- map["id"]
        name <- map["name"]
        
        cod <- map["cod"]
    }
}

// MARK: - Clouds
class Clouds: Mappable {
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

// MARK: - Main
class Main: Mappable {
    var temp: Double?
    var feelsLike: Int?
    var tempMin: Double?
    var tempMax: Double?
    var pressure: Int?
    var humidity: Int?

    init(
        temp: Double?,
        feelsLike: Int?,
        tempMin: Double?,
        tempMax: Double?,
        pressure: Int?,
        humidity: Int?
    ) {
        self.temp = temp
        self.feelsLike = feelsLike
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.pressure = pressure
        self.humidity = humidity
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        temp <- map["temp"]
        feelsLike <- map["feels_like"]
        tempMin <- map["temp_min"]
        tempMax <- map["temp_max"]
        
        pressure <- map["pressure"]
        humidity <- map["humidity"]
    }
}

// MARK: - Sys
class Sys: Mappable {
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

// MARK: - Weather
class Weather: Mappable {
    var id: Int?
    var main, weatherDescription, icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }

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

// MARK: - Wind
class Wind: Mappable {
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
