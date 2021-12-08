//
//  AboutTableViewCellRepresentable.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 24/11/2021.
//

import UIKit

class AboutCellRepresentable: TableViewCellRepresentable {
    var cellHeight: CGFloat
    
    var cellReuseIdentifire: String
    
    private(set) var AboutUser: String // nsattr

    init() {
        self.cellHeight = AboutTableViewCell.getHeight()
        self.cellReuseIdentifire = AboutTableViewCell.getReuseIdentifier()
        self.AboutUser = String()
    }
    
    convenience init(About: String) {
        self.init()
        self.AboutUser = About
    }
    
}
