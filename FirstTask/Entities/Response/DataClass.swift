//
//  DataClass.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 08/11/2021.
//

import Foundation


// MARK: - DataClass
struct DataClass: Codable {
    var hits: Int
    var users: [User]
    
    enum CodingKeys: String, CodingKey {
        case hits
        case users = "results"
    }
    
    init() {
        self.hits = 0
        self.users = []
    }
    

}
