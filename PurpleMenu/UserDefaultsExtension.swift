//
//  UserDefaultsExtension.swift
//  PurpleMenu
//
//  Created by Andrew Ng on 10/8/20.
//

import Foundation

extension UserDefaults {
    @objc var sensorId: String {
        get {
            return string(forKey: "sensor_id") ?? "67533"
        }
        set {
            set(newValue, forKey: "sensor_id")
        }
    }
}