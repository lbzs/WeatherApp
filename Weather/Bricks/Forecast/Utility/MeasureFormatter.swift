//
//  MeasureFormatter.swift
//  Weather
//
//  Created by Balint Zsombor Lakatos on 2019. 11. 24..
//  Copyright © 2019. Balint Zsombor Lakatos. All rights reserved.
//

import Foundation

class MeasureFormatterUtil {
    static func format(value: Int) -> String {
        let measurement = Measurement(value: Double(value), unit: UnitTemperature.celsius)
        let formatter = MeasurementFormatter()
        formatter.locale = Locale(identifier: "en_GB")
        return formatter.string(from: measurement)
    }
}
