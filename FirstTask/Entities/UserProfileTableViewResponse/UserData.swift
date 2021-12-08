//
//  UserData.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 08/12/2021.
//

import Foundation

// MARK: - UserData
struct UserData: Codable {
    var availability: [Availability]
    var backgroundImage, currentJob: String
    var experience: [Experience]
    var profileImage: String
    var userInfo: UserInfo
    var userSkill: [UserSkill]

    enum CodingKeys: String, CodingKey {
        case availability
        case backgroundImage = "background_image"
        case currentJob = "current_job"
        case experience
        case profileImage = "profile_image"
        case userInfo = "user_info"
        case userSkill = "user_skill"
    }

    init() {
        self.availability = []
        self.backgroundImage = ""
        self.currentJob = ""
        self.experience = []
        self.profileImage = ""
        self.userInfo = UserInfo()
        self.userSkill = []
    }
            
    
    init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let availabilityDic = (try? container.decode([String : Bool].self, forKey: .availability)) ?? [:]
        
        for (key, value) in availabilityDic {
            if value {
                self.availability.append(Availability(rawValue: key)!)
            }
        }
        
        self.backgroundImage = (try? container.decode(String.self, forKey: .backgroundImage)) ?? self.backgroundImage
        self.currentJob = (try? container.decode(String.self, forKey: .currentJob)) ?? self.currentJob
        self.experience = (try? container.decode([Experience].self, forKey: .experience)) ?? self.experience
        self.profileImage = (try? container.decode(String.self, forKey: .profileImage)) ?? self.profileImage
        self.userInfo = (try? container.decode(UserInfo.self, forKey: .userInfo)) ?? self.userInfo
        self.userSkill = (try? container.decode([UserSkill].self, forKey: .userSkill)) ?? self.userSkill
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        var availabiltiyDic = [String: Bool]()
        for availabiltiyKey in Availability.allCases {
                availabiltiyDic[availabiltiyKey.rawValue] = self.availability.contains(availabiltiyKey)
        }
        try container.encode(availabiltiyDic, forKey: .availability)
        try container.encode(backgroundImage, forKey: .backgroundImage)
        try container.encode(currentJob, forKey: .currentJob)
        try container.encode(experience, forKey: .experience)
        try container.encode(profileImage, forKey: .profileImage)
        try container.encode(userInfo, forKey: .userInfo)
        try container.encode(userSkill, forKey: .userSkill)
    }

}
