//
//  CityDetailViewModel.swift
//  Weather
//
//  Created by Balint Zsombor Lakatos on 2019. 11. 22..
//  Copyright © 2019. Balint Zsombor Lakatos. All rights reserved.
//

import Foundation

class CityDetailViewModel: ViewModel {

    @Published private(set) var state: CityDetailState

    private var weatherService: WeatherService
    private let city: String

    init(city: String, weatherService: WeatherService) {
        self.state = CityDetailState(city: city, details: [])
        self.weatherService = weatherService
        self.city = city

        dowloadData()
    }

    func dowloadData() {
        weatherService.fetchWeather(by: city, completionHandler: { forecast in
            
            self.state.details = []
            let dictionaryByDate = Dictionary(grouping: forecast) { Calendar.current.component(.day, from: $0.time) }
            dictionaryByDate.keys.forEach {
                let forecast = dictionaryByDate[$0].flatMap { $0 }
                self.state.details.append(AnyViewModel(CityDetailCellViewModel(temperature:
                    Int((dictionaryByDate[$0]!.map { $0.temperature.overallTemp }.max() ?? 0 )),
                                                                                 date: dictionaryByDate[$0]!.first!.time,
                                                                                 description: dictionaryByDate[$0]!.first!.weather.first!.description,
                                                                                 forecast: forecast!)))
                self.state.details.sort { (left, right) -> Bool in
                    left.date < right.date
                }
            }
        })
    }

    func trigger(_ input: Never) {
        
    }
}
