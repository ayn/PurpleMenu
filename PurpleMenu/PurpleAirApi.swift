//
//  PurpleAirApi.swift
//  PurpleMenu
//
//  Created by Andrew Ng on 10/6/20.
//

import Foundation

class PurpleAirApi {
    var urlString: String

    init(sensorId: String) {
        urlString = "https://www.purpleair.com/json?show=" + sensorId
    }

    func getData(completionHandler: @escaping (Sensor) -> ()) {
        guard let url = URL(string: urlString) else { return }

        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
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
