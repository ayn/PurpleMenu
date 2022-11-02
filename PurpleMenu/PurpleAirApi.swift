//
//  PurpleAirApi.swift
//  PurpleMenu
//
//  Created by Andrew Ng on 10/6/20.
//

import Foundation

class PurpleAirApi {
    var urlString: String
    var apiKey: String

    init(sensorId: String, apiKey: String) {
        urlString = "https://www.purpleair.com/json?show=" + sensorId
        self.apiKey = apiKey
    }

    func getData(completionHandler: @escaping (Sensor) -> ()) {
        guard let url = URL(string: urlString) else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(apiKey, forHTTPHeaderField: "X-API-Key")

        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil, let data = data else { return }

            let decoder = JSONDecoder()

            do {
                let sensor = try decoder.decode(Sensor.self, from: data)
                completionHandler(sensor)
            } catch {
                debugPrint("error decoding response")
            }
        }

        dataTask.resume()
    }
}
