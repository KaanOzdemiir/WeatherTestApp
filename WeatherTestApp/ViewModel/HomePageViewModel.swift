//
//  HomePageViewModel.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 28.09.2020.
//

import Foundation
import ObjectMapper
import RxSwift

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
    
    var shouldPresentCitySelection = UserVariables.selectedCitiesJSONString.isEmpty
    
    let weatherRepo = WeatherRespository()
    
    let disposeBag = DisposeBag()
    
    var weatherResponse: WeatherResponse?
    
    var currentSelectedCity: CityData?
    
    init() {
        if let selectedCities = Mapper<CityData>().mapArray(JSONString: UserVariables.selectedCitiesJSONString), selectedCities.count > 0 {
            currentSelectedCity = selectedCities.first
        }
    }
    
    func fetchSelectedCities(completionHandler: @escaping (Bool) -> Void) {
        
        if let selectedCities = Mapper<CityData>().mapArray(JSONString: UserVariables.selectedCitiesJSONString), selectedCities.count > 0 {
            selectedCities.first?.isSelected = true
            cities = selectedCities
            completionHandler(true)
        }else{
            completionHandler(false)
        }
    }
    
    func fetchWeather(completionHandler: @escaping (ResponseState<WeatherResponse>) -> Void) {
        
        var params: [String: Any] = [:]
        if !(params.count > 0) {
            params = [
                "q": "\(currentSelectedCity?.name ?? ""),\(currentSelectedCity?.country ?? "")"
            ]
        }
        
        weatherRepo.getWeather(params: params).subscribe(onNext: { (response) in
            completionHandler(.success(response))
        }, onError: { (error) in
            completionHandler(.failed(error))
        }).disposed(by: disposeBag)
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
