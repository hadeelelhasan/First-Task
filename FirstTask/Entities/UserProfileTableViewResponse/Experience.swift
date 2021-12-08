//
//  Experince.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 08/12/2021.
//

import Foundation

// MARK: - Experience
struct Experience: Codable {
    var work: Work

    enum CodingKeys: String, CodingKey {
        case work = "Work"
    }

    init() {
        self.work = Work()
    }

}
