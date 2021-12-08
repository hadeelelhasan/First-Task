//
//  PositionInfo.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 08/12/2021.
//

import Foundation

struct PositionInfo: Codable {
    var code: String
    var description: String
    var id: Int
    var name: String
    
    init() {
        self.code = ""
        self.description = ""
        self.id = 0
        self.name = ""
    }
}
