//
//  CityWeatherViewModel.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 3.10.2020.
//

import Foundation
import RxSwift
import ObjectMapper

class CityWeatherViewModel {
    
    var weatherRepo: WeatherRespository!
    
    init() {
        if let selectedCities = Mapper<CityData>().mapArray(JSONString: UserVariables.selectedCitiesJSONString), selectedCities.count > 0 {
            self.selectedCities = selectedCities
        }
        weatherRepo = WeatherRespository()
    }
    
    let disposeBag = DisposeBag()
    var selectedCities: [CityData] = []
    
    var cityWeatherForecasts: [ForecastResponse] = []
    
    func fetchCityForecast(cityID: String, completionHandler: @escaping (ResponseState<ForecastResponse>) -> Void) {
        
        var params: [String: Any] = [:]
        params = [
            "id": cityID
        ]
        
        weatherRepo.getForecast(params: params).subscribe(onNext: { [weak self] (response) in
            guard let self = self else { return }
            completionHandler(.success(response))
        }, onError: { (error) in
            completionHandler(.failed(error))
        }).disposed(by: disposeBag)
    }
    
    func fetchSelectedCitiesWeatherForecast(completionHandler: @escaping (ResponseState<[ForecastResponse]>) -> Void) {
        
        selectedCities.forEach { (city) in
            fetchCityForecast(cityID: "\(city.id)") { [weak self] (response) in
                guard let self = self else { return }

                switch response{
                case .success(let response):
                    self.cityWeatherForecasts.append(response)
                    completionHandler(.success(self.cityWeatherForecasts))
                case .failed(let error):
                    completionHandler(.failed(error))
                }
            }
        }
    }
}

