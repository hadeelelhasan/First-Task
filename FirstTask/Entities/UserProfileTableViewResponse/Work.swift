//
//  Work.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 08/12/2021.
//

import Foundation

// MARK: - Work
struct Work: Codable {
    var brand: Brand
    var position: PositionInfo
    var brandID: Int
    var description: String
    var id: Int
    var startDate: Date
    var endDate: Date?

    enum CodingKeys: String, CodingKey {
        case brand = "Brand"
        case position = "Position"
        case brandID = "brand_id"
        case description
        case id
        case startDate = "start_date"
        case endDate = "end_date"
    }
    
    init() {
        self.brand = Brand()
        self.position = PositionInfo()
        self.brandID = 0
        self.description = ""
        self.id = 0
        self.startDate = Date()
    }
    
    init(from decoder: Decoder) throws {
        self.init()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.brand = try container.decode(Brand.self, forKey: .brand)
        self.position = try container.decode(PositionInfo.self, forKey: .position)
        self.brandID = try container.decode(Int.self, forKey: .brandID)
        self.description = try container.decode(String.self, forKey: .description)
        self.id = try container.decode(Int.self, forKey: .id)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
        
        let endDateString = (try? container.decode(String.self, forKey: .endDate)) ?? ""
        if let date = dateFormatter.date(from: endDateString) {
            self.endDate = date
        }
        
        let startDateString = (try? container.decode(String.self, forKey: .startDate)) ?? ""
        if let date = dateFormatter.date(from: startDateString) {
            self.startDate = date
        }
    }

}
