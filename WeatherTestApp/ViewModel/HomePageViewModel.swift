//
//  HomePageViewModel.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 28.09.2020.
//

import Foundation

class HomePageViewModel {
    
    var cities: [CityData] = []
    
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
}
