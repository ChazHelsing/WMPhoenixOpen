//
//  WeatherService.swift
//  Test
//
//  Created by Chaz Helsing on 1/25/17.
//  Copyright © 2017 Helsing Productions. All rights reserved.
//

import Foundation
import CoreLocation
import SwiftyJSON

protocol WeatherServiceDelegate {
    func setWeather(_ weather: Weather)
    func weatherErrorWithMessage(_ message: String)
}

class WeatherService {
    
    let appid: String
    
    var delegate: WeatherServiceDelegate?
    
    init(appid: String) {
        self.appid = appid
    }
    
    func getWeatherForLocation() {
        
        let lat = /* location.coordinate.latitude */ 33.64191959
        
        let lon = /* location.coordinate.longitude */ -111.91459179
        
        let path = "http://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(appid)"
        
        getWeatherWithPath(path)
    }
    
    func getWeatherWithPath(_ path: String) {
        
        let url = URL(string: path)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { (data: Data?, response: URLResponse?, error: Error?) in

            if let httpResponse = response as? HTTPURLResponse {
                print("*******")
                print(httpResponse.statusCode)
                print("*******")
            }
            
            let json = JSON(data: data!)
            print(json)
            
            // Get the cod code:  401 Unauthorized, 404 file not found, 200 ok!
            // OpenWeatherMap returns 404 as a string but 401 and 200 are Int!?
            
            var status = 0
            
            if let cod = json["cod"].int {
                status = cod
            } else if let cod = json["cod"].string {
                status = Int(cod)!
            }

            if status == 200 {
                let _ = json["coord"]["lon"].double
                let _ = json["coord"]["lat"].double
                let temp = json["main"]["temp"].int
                let wind = json["wind"]["speed"].int
                let desc = json["weather"][0]["description"].string
                
                let weather = Weather(temp: temp!, description: desc!, windSpeed: wind!)
                print("the temp is \(weather.tempF)")
                
                if self.delegate != nil {
                    DispatchQueue.main.async(execute: {
                        self.delegate?.setWeather(weather)
                    })
                }
            } else if status == 404 {
                if self.delegate != nil {
                    DispatchQueue.main.async(execute: {
                        self.delegate?.weatherErrorWithMessage("City not found")
                    })
                }
            }
        }
        task.resume()
    }
}
