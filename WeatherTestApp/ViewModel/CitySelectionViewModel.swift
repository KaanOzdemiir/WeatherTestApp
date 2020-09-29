//
//  CitySelectionViewModel.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 29.09.2020.
//

import Foundation
import RxSwift

struct GrouppedCityData {
    var sectionName: String = ""
    var sectionObjects: [CityData] = []
}

enum ResponseState<T> {
    case success(T)
    case failed(Error)
}

class CitySelectionViewModel {
    
    let disposeBag = DisposeBag()
    
    let cityRepository = CityRespository()
    
    var cities: [CityData] = []
    
    var groppedCities: [GrouppedCityData] = []
    
    var selectedCities: [CityData] = []
    
    var isSelectionDone = PublishSubject<Bool>()
    
    func fetchCities(params: [String: Any], completionHandler: @escaping (ResponseState<[GrouppedCityData]>) -> Void) {
        
        
        cityRepository.getCities(params: params).subscribe(onNext: { [weak self] (cities) in
            guard let self = self else { return }
            self.cities = cities
            
            UserVariables.selectedCitiesJSONString.split(separator: "-").forEach { (id) in
                self.cities.first(where: {"\($0.id)" == id})?.isSelected = true
            }
            self.groppedCities.removeAll()
            
            let grouppedCities = Dictionary(grouping: cities.filter({!($0.name.isEmpty)})) { $0.name.first! }
            
            grouppedCities.forEach { (key, value) in
                let city = GrouppedCityData(sectionName: "\(key)", sectionObjects: value)
                self.groppedCities.append(city)
            }
            
            self.groppedCities.sort(by: {$0.sectionName < $1.sectionName})
            completionHandler(.success(self.groppedCities))
        }, onError: { [weak self] (error) in
            completionHandler(.failed(error))
        }).disposed(by: disposeBag)
      }
}

