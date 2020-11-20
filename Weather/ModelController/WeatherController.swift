//
//  WeatherController.swift
//  Weather
//
//  Created by Heli Bavishi on 11/18/20.
//

import Foundation
let APIKey = "bb15dc0d441f171472c0b3dd70b3fb7c"

class WeatherController {
    //http://api.openweathermap.org/data/2.5/weather?q=florida&appid=bb15dc0d441f171472c0b3dd70b3fb7c
    
    static let shared = WeatherController()
    static let baseURL = URL(string: "http://api.openweathermap.org/data/2.5/weather")
    
    static func fetchWeather(searchTerm: String, completion: @escaping (Result<TopLevelDictionary,WeatherError>) -> Void) {
        
        guard let baseURL = baseURL else { return completion(.failure(.invalidURL)) }
        
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        
        let searchTermQuery = URLQueryItem(name: "q", value: searchTerm)
        let apiKeyQuery = URLQueryItem(name: "appid", value: APIKey)
        
        components?.queryItems = [searchTermQuery, apiKeyQuery]
        
        guard let finalURL = components?.url else {return completion(.failure(.invalidURL))}
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            guard let data = data else { return completion(.failure(.noData))}
            
            do {
                let topLevelDict = try JSONDecoder().decode(TopLevelDictionary.self, from: data)
                
               return completion(.success(topLevelDict))
            } catch {
                return completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
    
}//END of class
