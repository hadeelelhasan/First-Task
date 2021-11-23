//
//  Response.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 18/10/2021.
//


import Foundation

// MARK: - Response
struct Response: Codable {
   var data: DataClass
   var status: String
   var statusCode: Int
    
    enum CodingKeys: String, CodingKey, CaseIterable {
        case data, status
        case statusCode = "status_code"
    }
    
    init() {
        self.data = DataClass()
        self.status = ""
        self.statusCode = 0
    }
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.data = try container.decode(DataClass.self, forKey: .data) ?? ""
//        self.status = try container.decode(String.self, forKey: .status)
//        self.statusCode = try container.decode(Int.self, forKey: .statusCode)
//      }
}










