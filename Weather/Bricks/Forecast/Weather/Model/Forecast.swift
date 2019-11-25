//
//  Forecast.swift
//  Weather
//
//  Created by Balint Zsombor Lakatos on 2019. 11. 23..
//  Copyright © 2019. Balint Zsombor Lakatos. All rights reserved.
//

import Foundation

struct Forecast: Decodable, Identifiable {
    var id = UUID()
    var weather: [Weather]
    var temperature: Temperature
    var time: Date

    private enum CodingKeys: String, CodingKey {
        case weather
        case time = "dt"
        case temperature = "main"
    }
}
