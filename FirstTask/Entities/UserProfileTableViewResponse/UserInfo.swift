//
//  UserInfo.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 08/12/2021.
//

import Foundation

// MARK: - UserInfo
struct UserInfo: Codable {
    var about, birthDate, created, currentLoginAt: String
    var currentLoginIP: String
    var feature: Bool
    var firstName: String
    var id: Int
    var isPublic: Bool
    var lastLoginAt, lastLoginIP, lastName: String
    var loginCount: Int
    var slug, updated: String
    var userCandidate, userEmployer: Bool
    var username: String
    
    init() {
        self.about = ""
        self.birthDate = ""
        self.created = ""
        self.currentLoginAt = ""
        self.currentLoginIP = ""
        self.feature = false
        self.firstName = ""
        self.id = 0
        self.isPublic = false
        self.lastLoginAt = ""
        self.lastLoginIP = ""
        self.lastName = ""
        self.loginCount = 0
        self.slug = ""
        self.updated = ""
        self.userCandidate = false
        self.userEmployer = false
        self.username = ""
        
    }

    enum CodingKeys: String, CodingKey {
        case about
        case birthDate = "birth_date"
        case created
        case currentLoginAt = "current_login_at"
        case currentLoginIP = "current_login_ip"
        case feature
        case firstName = "first_name"
        case id
        case isPublic = "is_public"
        case lastLoginAt = "last_login_at"
        case lastLoginIP = "last_login_ip"
        case lastName = "last_name"
        case loginCount = "login_count"
        case slug, updated
        case userCandidate = "user_candidate"
        case userEmployer = "user_employer"
        case username
    }
}
