//
//  CityRepository.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 29.09.2020.
//

import Foundation
import RxSwift

class CityRespository {
    
    func getCities(params: [String: Any]) -> Observable<[CityData]> {
        return Observable.create({ observer -> Disposable in
            
            AlamofireService.getCities(params: params, completion: { (response) in
                
                if let error = response.error {
                    print("‼️ Failed. (getCities) *-> Error: ", error.localizedDescription)
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
