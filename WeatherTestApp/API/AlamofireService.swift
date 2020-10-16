//
//  AlamofireService.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 29.09.2020.
//

import Alamofire
import AlamofireObjectMapper

class AlamofireService {
        
//    static let defaultHeaderParams = [
//        "accept": "application/json",
//        "apikey": ApplicationConfig.apiKey
//    ]
    
    static var urlScheme: String {
        get {
            return "https"
        }
    }
    
    static func getCities(params: [String: Any], completion: @escaping (DataResponse<[CityData]>) -> ()) {
        
        var urlComponents = URLComponents()
        urlComponents.host = ApplicationConfig.citiesHost
        urlComponents.path = URLPath.getCities
        urlComponents.scheme = urlScheme
        
        print("\n\(urlComponents.string!) istek atılıyor...")
        Alamofire.request(urlComponents.string!, method: .get, parameters: params, encoding: URLEncoding.default)
            .validate(statusCode: 200..<600)
            .responseArray { (response: DataResponse<[CityData]>) in
                print(response.result.value)
                completion(response)
            }
    }
    
    
    static func getWeatherForecast(params: [String: Any], completion: @escaping (DataResponse<ForecastResponse>) -> ()) {
        
        var urlComponents = URLComponents()
        urlComponents.host = ApplicationConfig.apiHost
        urlComponents.path = URLPath.forecast
        urlComponents.scheme = urlScheme
        
        urlComponents.queryItems = [
            URLQueryItem(name: "appid", value: ApplicationConfig.apiKey)
        ]
        
        params.forEach { (key, value) in
            if let valueStr = value as? String {
                urlComponents.queryItems?.append(URLQueryItem(name: key, value: valueStr))
            }
        }
        print("\n\(urlComponents.string!) istek atılıyor...")
        Alamofire.request(urlComponents.string!, method: .post, encoding: URLEncoding.default)
            .validate(statusCode: 200..<600)
            .responseObject { (response: DataResponse<ForecastResponse>) in
            
            print(response.result.value)
            completion(response)
        }
    }
    
    static func getForecast(params: [String: Any], completion: @escaping (DataResponse<ForecastResponse>) -> ()) {
        
        var urlComponents = URLComponents()
        urlComponents.host = ApplicationConfig.apiHost
        urlComponents.path = URLPath.forecast
        urlComponents.scheme = urlScheme
        
        urlComponents.queryItems = [
            URLQueryItem(name: "appid", value: ApplicationConfig.apiKey)
        ]
        
        params.forEach { (key, value) in
            if let valueStr = value as? String {
                urlComponents.queryItems?.append(URLQueryItem(name: key, value: valueStr))
            }
        }
        print("\n\(urlComponents.string!) istek atılıyor...")
        Alamofire.request(urlComponents.string!, method: .post, encoding: URLEncoding.default)
            .validate(statusCode: 200..<600)
            .responseObject { (response: DataResponse<ForecastResponse>) in
            
            print(response.result.value)
            completion(response)
        }
    }
}
