//
//  User.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 08/11/2021.
//

import Foundation


// MARK: - User
struct User: Codable {
    var brackgroundImageUUID: String
    var educations: [Education]
    var firstName: String
    
    var id: Int
    var isFirstJob: Bool
    var lastName: String
    var location: Location
    var primaryPosition: Position
    var positions: [Position]
    var profileImageUUID: String
    var slug: String
 
    enum CodingKeys: String, CodingKey {
        case brackgroundImageUUID , educations, firstName, first_Name, id, isFirstJob, lastName, location, primaryPosition = "position", positions, profileImageUUID, slug
    }
    
    init() {
        self.brackgroundImageUUID = ""
        self.educations = []
        self.firstName = ""
        self.id = 0
        self.isFirstJob = false
        self.lastName = ""
        self.location = Location()
        self.primaryPosition = Position()
        self.positions = []
        self.profileImageUUID = ""
        self.slug = ""
        
    }
    
    
    init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.brackgroundImageUUID = (try? container.decode(String.self, forKey: .brackgroundImageUUID)) ?? self.brackgroundImageUUID
        self.educations = try container.decode([Education].self, forKey: .educations)
        if let firstName = try? container.decode(String.self, forKey: .firstName) {
            self.firstName = firstName
        } else {
            self.firstName = try container.decode(String.self, forKey: .first_Name)
        }
        self.id = try container.decode(Int.self, forKey: .id)
        self.isFirstJob = (try? container.decode(Bool.self, forKey: .isFirstJob)) ?? self.isFirstJob
        self.lastName = try container.decode(String.self, forKey: .lastName)
        self.location = (try? container.decode(Location.self, forKey: .location)) ?? Location()
        self.primaryPosition = (try? container.decode(Position.self, forKey: .primaryPosition)) ?? self.primaryPosition
        self.positions = (try? container.decode([Position].self, forKey: .positions)) ?? self.positions
        self.profileImageUUID = (try? container.decode(String.self, forKey: .profileImageUUID)) ?? self.profileImageUUID
        self.slug = try container.decode(String.self, forKey: .slug)
      }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(brackgroundImageUUID, forKey: .brackgroundImageUUID)
        try container.encode(educations, forKey: .educations)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(id, forKey: .id)
        try container.encode(isFirstJob, forKey: .isFirstJob)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(location, forKey: .location)
        try container.encode(primaryPosition, forKey: .primaryPosition)
        try container.encode(positions, forKey: .positions)
        try container.encode(profileImageUUID, forKey: .profileImageUUID)
        try container.encode(slug, forKey: .slug)
    }
}
