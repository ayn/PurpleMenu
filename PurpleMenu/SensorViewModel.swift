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
    @Published var conversion = UserDefaults.standard.conversion {
        didSet {
            self.update()
        }
    }

    func update() {
        guard !sensorId.isEmpty else { return }

        UserDefaults.standard.sensorId = sensorId
        UserDefaults.standard.conversion = conversion
    }
}
