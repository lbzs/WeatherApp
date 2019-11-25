//
//  Temperature.swift
//  Weather
//
//  Created by Balint Zsombor Lakatos on 2019. 11. 24..
//  Copyright © 2019. Balint Zsombor Lakatos. All rights reserved.
//

import Foundation

struct Temperature: Codable {
    var overallTemp: Double
    var minimum: Double
    var maximum: Double

    private enum CodingKeys: String, CodingKey {
        case overallTemp = "temp"
        case minimum = "temp_min"
        case maximum = "temp_max"
    }
}
