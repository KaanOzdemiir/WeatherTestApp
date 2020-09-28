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
        .weeklyWeatherLayout
    ]
    
    var cities: [CityData] = []
    
    var timeWeathers: [TimeWeatherData] = []
    
    var weaklyWeathers: [WeaklyWeatherData] = []
    
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
    
    func fetchWeaklyWeathers(completionHandler: @escaping (Bool) -> Void) {
        let weaklyWeathers = [
            WeaklyWeatherData(dayName: "Pazartesi", weatherType: "rainy", maxDegree: 9, minDegree: 3),
            WeaklyWeatherData(dayName: "Salı", weatherType: "sunny_rainy", maxDegree: 12, minDegree: 6),
            WeaklyWeatherData(dayName: "Çarşamba", weatherType: "torrential_rain", maxDegree: 25, minDegree: 12),
            WeaklyWeatherData(dayName: "Perşembe", weatherType: "rainy", maxDegree: 34, minDegree: 16),
            WeaklyWeatherData(dayName: "Cuma", weatherType: "sunny", maxDegree: 8, minDegree: 7),
            WeaklyWeatherData(dayName: "Cumartesi", weatherType: "sunny_rainy", maxDegree: 19, minDegree: 13),
            WeaklyWeatherData(dayName: "Pazar", weatherType: "torrential_rain", maxDegree: 11, minDegree: 3)
        ]
        
        self.weaklyWeathers = weaklyWeathers
        completionHandler(true)
    }
}
