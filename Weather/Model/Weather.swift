//
//  Weather.swift
//  Weather
//
//  Created by Heli Bavishi on 11/18/20.
//

import Foundation

struct TopLevelDictionary: Codable {
    let name: String
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let sys: Sys
}

struct Weather: Codable {
    let description: String
}

struct Main: Codable {
    let temp: Double
    let humidity: Int
}

struct Wind: Codable {
    let speed : Double
}

struct Sys: Codable {
    let country: String
}
