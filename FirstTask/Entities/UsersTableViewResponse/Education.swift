//
//  Educatiob.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 08/11/2021.
//

import Foundation

// MARK: - Education
struct Education: Codable {
    var degree: String
    var discipline: String?
    var id: Int
    var institution: String
    
    init() {
        self.degree = ""
        self.discipline = ""
        self.id = 0
        self.institution = ""
    }
}
