//
//  CityListState.swift
//  Weather
//
//  Created by Balint Zsombor Lakatos on 2019. 11. 22..
//  Copyright © 2019. Balint Zsombor Lakatos. All rights reserved.
//

import Foundation

struct CityListState {
    var cities: [AnyViewModel<CityDetailState, Never>]
}
