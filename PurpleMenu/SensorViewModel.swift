//
//  SensorViewModel.swift
//  PurpleMenu
//
//  Created by Andrew Ng on 10/8/20.
//

import Foundation
import Combine

final class SensorViewModel: ObservableObject {
    static let userDefaultsKey = "SensorId"

    @Published var sensorId = UserDefaults.standard.sensorId

    func update() {
        if !sensorId.isEmpty {
            UserDefaults.standard.sensorId = sensorId
        }
    }
}
