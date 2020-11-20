//
//  WeatherError.swift
//  Weather
//
//  Created by Heli Bavishi on 11/18/20.
//

import Foundation

enum WeatherError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "unable to reach server beacause of bad URL"
        case .thrownError(let error):
            return error.localizedDescription
        case .noData:
            return "the server responded with no data"
        case .unableToDecode:
            return "the server responded with bad data for image"
        }
    }
}
