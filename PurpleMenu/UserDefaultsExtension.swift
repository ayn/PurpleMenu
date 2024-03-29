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
            return string(forKey: "sensor_id") ?? "70511"
        }
        set {
            set(newValue, forKey: "sensor_id")
        }
    }

    @objc var apiKey: String {
        get {
            return string(forKey: "apiKey") ?? "api-key"
        }
        set {
            set(newValue, forKey: "apiKey")
        }
    }

    @objc var conversion: String {
        get {
            return string(forKey: "conversion") ?? Conversion.epa.rawValue
        }
        set {
            set(newValue, forKey: "conversion")
        }
    }
}
