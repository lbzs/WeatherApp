//
//  CityDetailCellViewModel.swift
//  Weather
//
//  Created by Balint Zsombor Lakatos on 2019. 11. 24..
//  Copyright © 2019. Balint Zsombor Lakatos. All rights reserved.
//

import Foundation
import UIKit

class CityDetailCellViewModel: ViewModel {
    @Published var state: CityDetailCellState

    init(temperature: Int, date: Date, description: String, forecast: [Forecast]) {
        state = CityDetailCellState(temperature: temperature,
                                    date: date,
                                    description: description,
                                    forecast: forecast)
    }


    func trigger(_ input: Never) {
 
    }
}
