//
//  HomePageViewModel.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 28.09.2020.
//

import Foundation

class HomePageViewModel {
    
    var homePageLayoutData: [HomePageLayout] = [
        .citiesLayout,
        .dailyWeatherLayout,
        .timeWeatherLayout,
        .dailyDetailLayout,
//        .weeklyWeatherLayout
    ]
    
    var cities: [CityData] = []
    
    var timeWeathers: [TimeWeatherData] = []
    
    func fetchCities(completionHandler: @escaping (Bool) -> Void) {
        let cities = [
            CityData(name: "Ankara", isSelected: true),
            CityData(name: "İstanbul", isSelected: false),
            CityData(name: "Antalya", isSelected: false),
            CityData(name: "İzmir", isSelected: false),
            CityData(name: "Çankırı", isSelected: false)
        ]
        
        self.cities = cities
        completionHandler(true)
    }
    
    func fetchTimeWeathers(completionHandler: @escaping (Bool) -> Void) {
        let timeWeathers = [
            TimeWeatherData(time: "06:00", isCurrent: false),
            TimeWeatherData(time: "12:00", isCurrent: false),
            TimeWeatherData(time: "18:00", isCurrent: true),
            TimeWeatherData(time: "21:00", isCurrent: false),
            TimeWeatherData(time: "24:00", isCurrent: false),
        ]
        
        self.timeWeathers = timeWeathers
        completionHandler(true)
    }
}
