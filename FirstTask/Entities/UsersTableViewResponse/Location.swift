//
//  Location.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 08/11/2021.
//

import Foundation

// MARK: - Location
struct Location: Codable {
    var city: String
    var latitude, longitude: Double
    var state: String?  // we can replace optional with non-op by implement init(decoder)
    
    init() {
        self.city = ""
        self.latitude = 0.0
        self.longitude = 0.0
        self.state = ""
    }
}
