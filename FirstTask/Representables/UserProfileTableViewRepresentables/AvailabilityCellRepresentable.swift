//
//  AvailabilityCellRepresentable.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 24/11/2021.
//


import UIKit

class AvailabilityCellRepresentable : TableViewCellRepresentable {
    var cellHeight: CGFloat
    
    var cellReuseIdentifire: String
    
    private(set) var availabilities: [NSAttributedString]
    
    init() {
        self.cellHeight = AvailabilityTableViewCell.getHeight()
        self.cellReuseIdentifire = AvailabilityTableViewCell.getReuseIdentifier()
        self.availabilities = []
    }
    
    convenience init(availability: [Availability]) {
        self.init()
        let availabililtyAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: #colorLiteral(red: 0.2916044295, green: 0.5656878948, blue: 0.8853569627, alpha: 1),
                                                                   .font: UIFont.boldSystemFont(ofSize: 14)]
       
        self.availabilities = availability.map({ NSAttributedString(string: $0.rawValue, attributes: availabililtyAttributes) })
    }
    
}
