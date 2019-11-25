//
//  CityListViewModel.swift
//  Weather
//
//  Created by Balint Zsombor Lakatos on 2019. 11. 22..
//  Copyright © 2019. Balint Zsombor Lakatos. All rights reserved.
//

import Foundation

class CityListViewModel: ViewModel {
    @Published var state: CityListState

    init(cityService: CityService, weatherService: WeatherService) {
        let viewModels = cityService.fetchCities().map { AnyViewModel(CityDetailViewModel(city: $0, weatherService: weatherService))}
        state = CityListState(cities: viewModels)
    }

    func trigger(_ input: Never) {
        // Empty
    }
}
