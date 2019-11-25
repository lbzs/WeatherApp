//
//  OpenWeatherService.swift
//  Weather
//
//  Created by Balint Zsombor Lakatos on 2019. 11. 23..
//  Copyright © 2019. Balint Zsombor Lakatos. All rights reserved.
//

import Foundation

class OpenWeatherService: WeatherService {

    private let apiKey = "2932f9d3175e2f3dfd36585b79f12070"
    private let apiURL = "&appid="
    private let baseURL = "https://api.openweathermap.org/data/2.5/"
    private let metricURL = "&units=metric"
    private let forecastURL = "forecast?id="
    private let cityIDLookUP: [String: Int] = ["London":    2643743,
                                               "Paris":     2968815,
                                               "Berlin":    2950159,
                                               "Vienna":    2761369]
    
    func fetchWeather(by city: String, completionHandler: @escaping ([Forecast]) -> ()) {
        downloadData(city, completionHandler: completionHandler)
    }

    private func downloadData(_ city: String, completionHandler: @escaping ([Forecast]) -> ()) {
        guard let cityID = cityIDLookUP[city] else {
            print("Failed to fetch the city ID.")
            return
        }

        let url = URL(string: baseURL + forecastURL + "\(cityID)" + apiURL + apiKey + metricURL)!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error occured during the forecast fetch: \(error)")
            }

            if let data = data {
                do {
                    let list = try JSONDecoder().decode(WeatherList.self, from: data)

                    let forecast = list.list.filter {
                        let threeDays = Calendar.current.component(.day, from: Date()) + 3
                        return Calendar.current.component(.day, from: $0.time) <= threeDays
                    }

                    completionHandler(forecast)
                    return
                } catch {
                    print("Error occured during the JSON parsing. \(error)")
                }
            }
        }.resume()
    }
}
