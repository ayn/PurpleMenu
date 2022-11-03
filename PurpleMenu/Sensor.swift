//
//  Sensor.swift
//  PurpleMenu
//
//  Created by Andrew Ng on 10/6/20.
//

import Foundation

enum Conversion: String, CaseIterable, Identifiable {
    case none = "None", epa = "US EPA", aqandu = "AQandU", lrapa = "LRAPA", woodsmoke = "Woodsmoke"

    var id: String { self.rawValue }
    var description: String {
        return self.rawValue
    }
}

// MARK: - Sensors
struct Sensors: Codable {
    let apiVersion: String?
    let timeStamp, dataTimeStamp: Int?
    let sensor: Sensor?

    enum CodingKeys: String, CodingKey {
        case apiVersion = "api_version"
        case timeStamp = "time_stamp"
        case dataTimeStamp = "data_time_stamp"
        case sensor
    }
}

// MARK: - Sensor
struct Sensor: Codable {
    let sensorIndex, lastModified, dateCreated, lastSeen: Int?
    let sensorPrivate, isOwner: Int?
    let name: String?
    let icon, locationType: Int?
    let model, hardware: String?
    let ledBrightness: Int?
    let firmwareVersion, firmwareUpgrade: String?
    let rssi, uptime, paLatency, memory: Int?
    let positionRating: Int?
    let latitude, longitude: Double?
    let altitude, channelState, channelFlags, channelFlagsManual: Int?
    let channelFlagsAuto, confidence, confidenceAuto, confidenceManual: Int?
    let humidity, humidityA, temperature, temperatureA: Int?
    let pressure, pressureA, analogInput, pm10: Double?
    let pm10_A, pm10_B, pm25, pm25_A: Double?
    let pm25_B, pm25_Alt, pm25_AltA, pm25_AltB: Double?
    let pm100, pm100_A, pm100_B, scatteringCoefficient: Double?
    let scatteringCoefficientA, scatteringCoefficientB, deciviews, deciviewsA: Double?
    let deciviewsB, visualRange, visualRangeA, visualRangeB: Double?
    let the03_UmCount, the03_UmCountA, the03_UmCountB, the05_UmCount: Int?
    let the05_UmCountA, the05_UmCountB, the10_UmCount, the10_UmCountA: Int?
    let the10_UmCountB, the25_UmCount, the25_UmCountA, the25_UmCountB: Int?
    let the50_UmCount, the50_UmCountA, the50_UmCountB, the100_UmCount: Int?
    let the100_UmCountA, the100_UmCountB: Int?
    let pm10_CF1, pm10_CF1_A, pm10_CF1_B, pm10_ATM: Double?
    let pm10_ATMA, pm10_ATMB, pm25_ATM, pm25_ATMA: Double?
    let pm25_ATMB, pm25_CF1, pm25_CF1_A, pm25_CF1_B: Double?
    let pm100_ATM, pm100_ATMA, pm100_ATMB, pm100_CF1: Double?
    let pm100_CF1_A, pm100_CF1_B: Double?
    let primaryIDA: Int?
    let primaryKeyA: String?
    let primaryIDB: Int?
    let primaryKeyB: String?
    let secondaryIDA: Int?
    let secondaryKeyA: String?
    let secondaryIDB: Int?
    let secondaryKeyB: String?
    let stats, statsA, statsB: [String: Double]?

    enum CodingKeys: String, CodingKey {
        case sensorIndex = "sensor_index"
        case lastModified = "last_modified"
        case dateCreated = "date_created"
        case lastSeen = "last_seen"
        case sensorPrivate = "private"
        case isOwner = "is_owner"
        case name, icon
        case locationType = "location_type"
        case model, hardware
        case ledBrightness = "led_brightness"
        case firmwareVersion = "firmware_version"
        case firmwareUpgrade = "firmware_upgrade"
        case rssi, uptime
        case paLatency = "pa_latency"
        case memory
        case positionRating = "position_rating"
        case latitude, longitude, altitude
        case channelState = "channel_state"
        case channelFlags = "channel_flags"
        case channelFlagsManual = "channel_flags_manual"
        case channelFlagsAuto = "channel_flags_auto"
        case confidence
        case confidenceAuto = "confidence_auto"
        case confidenceManual = "confidence_manual"
        case humidity
        case humidityA = "humidity_a"
        case temperature
        case temperatureA = "temperature_a"
        case pressure
        case pressureA = "pressure_a"
        case analogInput = "analog_input"
        case pm10 = "pm1.0"
        case pm10_A = "pm1.0_a"
        case pm10_B = "pm1.0_b"
        case pm25 = "pm2.5"
        case pm25_A = "pm2.5_a"
        case pm25_B = "pm2.5_b"
        case pm25_Alt = "pm2.5_alt"
        case pm25_AltA = "pm2.5_alt_a"
        case pm25_AltB = "pm2.5_alt_b"
        case pm100 = "pm10.0"
        case pm100_A = "pm10.0_a"
        case pm100_B = "pm10.0_b"
        case scatteringCoefficient = "scattering_coefficient"
        case scatteringCoefficientA = "scattering_coefficient_a"
        case scatteringCoefficientB = "scattering_coefficient_b"
        case deciviews
        case deciviewsA = "deciviews_a"
        case deciviewsB = "deciviews_b"
        case visualRange = "visual_range"
        case visualRangeA = "visual_range_a"
        case visualRangeB = "visual_range_b"
        case the03_UmCount = "0.3_um_count"
        case the03_UmCountA = "0.3_um_count_a"
        case the03_UmCountB = "0.3_um_count_b"
        case the05_UmCount = "0.5_um_count"
        case the05_UmCountA = "0.5_um_count_a"
        case the05_UmCountB = "0.5_um_count_b"
        case the10_UmCount = "1.0_um_count"
        case the10_UmCountA = "1.0_um_count_a"
        case the10_UmCountB = "1.0_um_count_b"
        case the25_UmCount = "2.5_um_count"
        case the25_UmCountA = "2.5_um_count_a"
        case the25_UmCountB = "2.5_um_count_b"
        case the50_UmCount = "5.0_um_count"
        case the50_UmCountA = "5.0_um_count_a"
        case the50_UmCountB = "5.0_um_count_b"
        case the100_UmCount = "10.0_um_count"
        case the100_UmCountA = "10.0_um_count_a"
        case the100_UmCountB = "10.0_um_count_b"
        case pm10_CF1 = "pm1.0_cf_1"
        case pm10_CF1_A = "pm1.0_cf_1_a"
        case pm10_CF1_B = "pm1.0_cf_1_b"
        case pm10_ATM = "pm1.0_atm"
        case pm10_ATMA = "pm1.0_atm_a"
        case pm10_ATMB = "pm1.0_atm_b"
        case pm25_ATM = "pm2.5_atm"
        case pm25_ATMA = "pm2.5_atm_a"
        case pm25_ATMB = "pm2.5_atm_b"
        case pm25_CF1 = "pm2.5_cf_1"
        case pm25_CF1_A = "pm2.5_cf_1_a"
        case pm25_CF1_B = "pm2.5_cf_1_b"
        case pm100_ATM = "pm10.0_atm"
        case pm100_ATMA = "pm10.0_atm_a"
        case pm100_ATMB = "pm10.0_atm_b"
        case pm100_CF1 = "pm10.0_cf_1"
        case pm100_CF1_A = "pm10.0_cf_1_a"
        case pm100_CF1_B = "pm10.0_cf_1_b"
        case primaryIDA = "primary_id_a"
        case primaryKeyA = "primary_key_a"
        case primaryIDB = "primary_id_b"
        case primaryKeyB = "primary_key_b"
        case secondaryIDA = "secondary_id_a"
        case secondaryKeyA = "secondary_key_a"
        case secondaryIDB = "secondary_id_b"
        case secondaryKeyB = "secondary_key_b"
        case stats
        case statsA = "stats_a"
        case statsB = "stats_b"
    }
}
