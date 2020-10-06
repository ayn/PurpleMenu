//
//  Result.swift
//  PurpleMenu
//
//  Created by Andrew Ng on 10/6/20.
//

import Foundation

struct Result : Codable {
    let iD : Int?
    let label : String?
    let dEVICE_LOCATIONTYPE : String?
    let tHINGSPEAK_PRIMARY_ID : String?
    let tHINGSPEAK_PRIMARY_ID_READ_KEY : String?
    let tHINGSPEAK_SECONDARY_ID : String?
    let tHINGSPEAK_SECONDARY_ID_READ_KEY : String?
    let lat : Double?
    let lon : Double?
    let pM2_5Value : String?
    let lastSeen : Int?
    let type : String?
    let hidden : String?
    let dEVICE_BRIGHTNESS : String?
    let dEVICE_HARDWAREDISCOVERED : String?
    let dEVICE_FIRMWAREVERSION : String?
    let version : String?
    let lastUpdateCheck : Int?
    let created : Int?
    let uptime : String?
    let rSSI : String?
    let adc : String?
    let p_0_3_um : String?
    let p_0_5_um : String?
    let p_1_0_um : String?
    let p_2_5_um : String?
    let p_5_0_um : String?
    let p_10_0_um : String?
    let pm1_0_cf_1 : String?
    let pm2_5_cf_1 : String?
    let pm10_0_cf_1 : String?
    let pm1_0_atm : String?
    let pm2_5_atm : String?
    let pm10_0_atm : String?
    let isOwner : Int?
    let humidity : String?
    let temp_f : String?
    let pressure : String?
    let aGE : Int?
    let stats : String?

    enum CodingKeys: String, CodingKey {
        case iD = "ID"
        case label = "Label"
        case dEVICE_LOCATIONTYPE = "DEVICE_LOCATIONTYPE"
        case tHINGSPEAK_PRIMARY_ID = "THINGSPEAK_PRIMARY_ID"
        case tHINGSPEAK_PRIMARY_ID_READ_KEY = "THINGSPEAK_PRIMARY_ID_READ_KEY"
        case tHINGSPEAK_SECONDARY_ID = "THINGSPEAK_SECONDARY_ID"
        case tHINGSPEAK_SECONDARY_ID_READ_KEY = "THINGSPEAK_SECONDARY_ID_READ_KEY"
        case lat = "Lat"
        case lon = "Lon"
        case pM2_5Value = "PM2_5Value"
        case lastSeen = "LastSeen"
        case type = "Type"
        case hidden = "Hidden"
        case dEVICE_BRIGHTNESS = "DEVICE_BRIGHTNESS"
        case dEVICE_HARDWAREDISCOVERED = "DEVICE_HARDWAREDISCOVERED"
        case dEVICE_FIRMWAREVERSION = "DEVICE_FIRMWAREVERSION"
        case version = "Version"
        case lastUpdateCheck = "LastUpdateCheck"
        case created = "Created"
        case uptime = "Uptime"
        case rSSI = "RSSI"
        case adc = "Adc"
        case p_0_3_um = "p_0_3_um"
        case p_0_5_um = "p_0_5_um"
        case p_1_0_um = "p_1_0_um"
        case p_2_5_um = "p_2_5_um"
        case p_5_0_um = "p_5_0_um"
        case p_10_0_um = "p_10_0_um"
        case pm1_0_cf_1 = "pm1_0_cf_1"
        case pm2_5_cf_1 = "pm2_5_cf_1"
        case pm10_0_cf_1 = "pm10_0_cf_1"
        case pm1_0_atm = "pm1_0_atm"
        case pm2_5_atm = "pm2_5_atm"
        case pm10_0_atm = "pm10_0_atm"
        case isOwner = "isOwner"
        case humidity = "humidity"
        case temp_f = "temp_f"
        case pressure = "pressure"
        case aGE = "AGE"
        case stats = "Stats"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        iD = try values.decodeIfPresent(Int.self, forKey: .iD)
        label = try values.decodeIfPresent(String.self, forKey: .label)
        dEVICE_LOCATIONTYPE = try values.decodeIfPresent(String.self, forKey: .dEVICE_LOCATIONTYPE)
        tHINGSPEAK_PRIMARY_ID = try values.decodeIfPresent(String.self, forKey: .tHINGSPEAK_PRIMARY_ID)
        tHINGSPEAK_PRIMARY_ID_READ_KEY = try values.decodeIfPresent(String.self, forKey: .tHINGSPEAK_PRIMARY_ID_READ_KEY)
        tHINGSPEAK_SECONDARY_ID = try values.decodeIfPresent(String.self, forKey: .tHINGSPEAK_SECONDARY_ID)
        tHINGSPEAK_SECONDARY_ID_READ_KEY = try values.decodeIfPresent(String.self, forKey: .tHINGSPEAK_SECONDARY_ID_READ_KEY)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        lon = try values.decodeIfPresent(Double.self, forKey: .lon)
        pM2_5Value = try values.decodeIfPresent(String.self, forKey: .pM2_5Value)
        lastSeen = try values.decodeIfPresent(Int.self, forKey: .lastSeen)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        hidden = try values.decodeIfPresent(String.self, forKey: .hidden)
        dEVICE_BRIGHTNESS = try values.decodeIfPresent(String.self, forKey: .dEVICE_BRIGHTNESS)
        dEVICE_HARDWAREDISCOVERED = try values.decodeIfPresent(String.self, forKey: .dEVICE_HARDWAREDISCOVERED)
        dEVICE_FIRMWAREVERSION = try values.decodeIfPresent(String.self, forKey: .dEVICE_FIRMWAREVERSION)
        version = try values.decodeIfPresent(String.self, forKey: .version)
        lastUpdateCheck = try values.decodeIfPresent(Int.self, forKey: .lastUpdateCheck)
        created = try values.decodeIfPresent(Int.self, forKey: .created)
        uptime = try values.decodeIfPresent(String.self, forKey: .uptime)
        rSSI = try values.decodeIfPresent(String.self, forKey: .rSSI)
        adc = try values.decodeIfPresent(String.self, forKey: .adc)
        p_0_3_um = try values.decodeIfPresent(String.self, forKey: .p_0_3_um)
        p_0_5_um = try values.decodeIfPresent(String.self, forKey: .p_0_5_um)
        p_1_0_um = try values.decodeIfPresent(String.self, forKey: .p_1_0_um)
        p_2_5_um = try values.decodeIfPresent(String.self, forKey: .p_2_5_um)
        p_5_0_um = try values.decodeIfPresent(String.self, forKey: .p_5_0_um)
        p_10_0_um = try values.decodeIfPresent(String.self, forKey: .p_10_0_um)
        pm1_0_cf_1 = try values.decodeIfPresent(String.self, forKey: .pm1_0_cf_1)
        pm2_5_cf_1 = try values.decodeIfPresent(String.self, forKey: .pm2_5_cf_1)
        pm10_0_cf_1 = try values.decodeIfPresent(String.self, forKey: .pm10_0_cf_1)
        pm1_0_atm = try values.decodeIfPresent(String.self, forKey: .pm1_0_atm)
        pm2_5_atm = try values.decodeIfPresent(String.self, forKey: .pm2_5_atm)
        pm10_0_atm = try values.decodeIfPresent(String.self, forKey: .pm10_0_atm)
        isOwner = try values.decodeIfPresent(Int.self, forKey: .isOwner)
        humidity = try values.decodeIfPresent(String.self, forKey: .humidity)
        temp_f = try values.decodeIfPresent(String.self, forKey: .temp_f)
        pressure = try values.decodeIfPresent(String.self, forKey: .pressure)
        aGE = try values.decodeIfPresent(Int.self, forKey: .aGE)
        stats = try values.decodeIfPresent(String.self, forKey: .stats)
    }

}
