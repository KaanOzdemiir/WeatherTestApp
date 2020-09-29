//
//  WeatherRepository.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 29.09.2020.
//

import Foundation
import RxSwift

class WeatherRespository {
    
    func getWeather(params: [String: Any]) -> Observable<WeatherResponse> {
        return Observable.create({ observer -> Disposable in
            
            AlamofireService.getWeather(params: params, completion: { (response) in
                
                if let error = response.error {
                    print("‼️ Failed. (getWeather) *-> Error: ", error.localizedDescription)
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
