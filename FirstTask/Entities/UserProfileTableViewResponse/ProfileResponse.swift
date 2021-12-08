//
//  ProfileEntites.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 24/11/2021.
//

import Foundation

// MARK: - ProfileResponse
struct ProfileResponse: Codable {
    var data: UserData
    var status: String
    var statusCode: Int

    enum CodingKeys: String, CodingKey {
        case data, status
        case statusCode = "status_code"
    }
    
    init() {
        self.data = UserData()
        self.status = String()
        self.statusCode = Int()
    }
}






