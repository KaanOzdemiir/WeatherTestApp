//
//  WeatherRepository.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 29.09.2020.
//

import Foundation
import RxSwift

class WeatherRespository {
    
    func getWeatherForecast(params: [String: Any]) -> Observable<ForecastResponse> {
        return Observable.create({ observer -> Disposable in
            
            AlamofireService.getWeatherForecast(params: params, completion: { (response) in
                
                if let error = response.error {
                    print("‼️ Failed. (getWeatherForecast) *-> Error: ", error.localizedDescription)
                    observer.onError(error)
                    return
                }
                
                observer.onNext(response.result.value!)
                observer.onCompleted()
            })
            return Disposables.create()
        })
    }
    
    func getForecast(params: [String: Any]) -> Observable<ForecastResponse> {
        return Observable.create({ observer -> Disposable in
            
            AlamofireService.getForecast(params: params, completion: { (response) in
                
                if let error = response.error {
                    print("‼️ Failed. (getForecast) *-> Error: ", error.localizedDescription)
                    observer.onError(error)
                    return
                }
                
                observer.onNext(response.result.value!)
                observer.onCompleted()
            })
            return Disposables.create()
        })
    }
}
