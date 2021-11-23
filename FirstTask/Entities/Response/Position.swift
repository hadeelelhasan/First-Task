//
//  PrimaryPosition.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 08/11/2021.
//

import Foundation

// MARK: - Position
struct Position: Codable {
    var brandName: String?
    var endDate: Date
    var name: String
    var startDate: Date
    
    enum CodingKeys: String, CodingKey {
        case brandName , endDate, name, startDate
    }

    init() {
        self.brandName = ""
        self.endDate = Date()
        self.name = ""
        self.startDate = Date()
    }
    
    init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.brandName = (try? container.decode(String.self, forKey: .brandName)) ?? ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, dd MMM yyyy HH:mm:ss zzz"
        
        let endDateString = try container.decode(String.self, forKey: .startDate)
        guard let date = dateFormatter.date(from: endDateString) else { return }
        self.endDate = date
        
        self.name = try container.decode(String.self, forKey: .name)
        
        let startDateString = try container.decode(String.self, forKey: .startDate)
        guard let date = dateFormatter.date(from: startDateString) else { return }
        self.startDate = date
      }
}
