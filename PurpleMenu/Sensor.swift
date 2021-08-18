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

struct Sensor: Codable {
    let mapVersion : String?
    let baseVersion : String?
    let mapVersionString : String?
    let results : [Result]?

    enum CodingKeys: String, CodingKey {
        case mapVersion = "mapVersion"
        case baseVersion = "baseVersion"
        case mapVersionString = "mapVersionString"
        case results = "results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        mapVersion = try values.decodeIfPresent(String.self, forKey: .mapVersion)
        baseVersion = try values.decodeIfPresent(String.self, forKey: .baseVersion)
        mapVersionString = try values.decodeIfPresent(String.self, forKey: .mapVersionString)
        results = try values.decodeIfPresent([Result].self, forKey: .results)
    }
}
