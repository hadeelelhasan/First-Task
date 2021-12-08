//
//  Brand.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 08/12/2021.
//

import Foundation

// MARK: - Brand
struct Brand: Codable {
    var created, brandDescription: String
    var groupID: Int
    var hideImages: Bool
    var id: Int
    var name, type, updated: String

    enum CodingKeys: String, CodingKey {
        case created
        case brandDescription = "description"
        case groupID = "group_id"
        case hideImages = "hide_images"
        case id
        case name, type, updated
    }
    
    init() {
        self.created = ""
        self.brandDescription = ""
        self.groupID = 0
        self.hideImages = false
        self.id = 0
        self.name = ""
        self.type = ""
        self.updated = ""
    }
}
