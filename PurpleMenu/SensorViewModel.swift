//
//  SensorViewModel.swift
//  PurpleMenu
//
//  Created by Andrew Ng on 10/8/20.
//

import Foundation
import Combine

final class SensorViewModel: ObservableObject {
    @Published var sensorId = UserDefaults.standard.sensorId
    @Published var apiKey = UserDefaults.standard.apiKey
    @Published var conversion = UserDefaults.standard.conversion {
        didSet {
            self.update()
        }
    }

    func update() {
        guard !sensorId.isEmpty else { return }

        UserDefaults.standard.conversion = conversion
        UserDefaults.standard.sensorId = sensorId
        UserDefaults.standard.apiKey = apiKey
    }
}
