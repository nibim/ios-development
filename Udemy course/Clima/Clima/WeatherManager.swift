//
//  WeatherManager.swift
//  Clima
//
//  Created by Nima Beig Mohammadi on 05.05.25.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import Foundation


struct WeatherManager {
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=f6b2af14866c2f4faab224b133ada438&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in    /* This sets up a request and attaches a closure that should run when the response comes back.*/
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            
            task.resume( )
        }
    }
    
    func parseJSON(weatherData: Data) {
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)  // from weatherData it stores the info to WeatherData struct format
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            
        } catch {
            print(error)
        }
        
    }
    
}
