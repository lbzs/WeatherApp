//
//  WeatherService.swift
//  Weather
//
//  Created by Balint Zsombor Lakatos on 2019. 11. 23..
//  Copyright © 2019. Balint Zsombor Lakatos. All rights reserved.
//

protocol WeatherService {

    func fetchWeather(by city: String, completionHandler: @escaping ([Forecast]) -> ())
}
