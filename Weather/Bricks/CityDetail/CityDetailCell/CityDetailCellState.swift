//
//  CityDetailCellState.swift
//  Weather
//
//  Created by Balint Zsombor Lakatos on 2019. 11. 24..
//  Copyright © 2019. Balint Zsombor Lakatos. All rights reserved.
//

import Foundation

struct CityDetailCellState: Identifiable {
    var id = UUID()
    var temperature: Int
    var date: Date
    var description: String
    var forecast: [Forecast]
}
