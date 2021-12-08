//
//  ExperienceTableViewCellRepresentable.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 24/11/2021.
//

import UIKit

class ExperienceCellRepresentable: TableViewCellRepresentable {
    var cellHeight: CGFloat
    
    var cellReuseIdentifire: String
    
    private(set) var dates: NSAttributedString
    
    private(set) var position: NSAttributedString
    
    private(set) var brandName: NSAttributedString
    
    private(set) var jobDescription: NSAttributedString
    
    init() {
        self.cellHeight = ExperienceTableViewCell.getHeight()
        self.cellReuseIdentifire = ExperienceTableViewCell.getReuseIdentifier()
        self.dates = NSAttributedString()
        self.position = NSAttributedString()
        self.brandName = NSAttributedString()
        self.jobDescription = NSAttributedString()
    }
    
    convenience init(experience: Experience) {
        self.init()
        
        let datesAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1),
                                                                       .font: UIFont.systemFont(ofSize: 13)]

        self.dates = NSAttributedString(string: createDatesString(startDate: experience.work.startDate, endDate: experience.work.endDate), attributes: datesAttributes)
        

        let positionAttributes: [NSAttributedString.Key: Any] = [ .foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                                                  .font: UIFont.boldSystemFont(ofSize: 15)]
        self.position = NSAttributedString(string: experience.work.position.name, attributes: positionAttributes)
        
        let brandNameAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: #colorLiteral(red: 0.2916044295, green: 0.5656878948, blue: 0.8853569627, alpha: 1),
                                                                  .font: UIFont.boldSystemFont(ofSize: 14)]
        self.brandName = NSAttributedString(string: experience.work.brand.name, attributes: brandNameAttributes)
        
        let jobDescriptionAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1),
                                                                       .font: UIFont.systemFont(ofSize: 14)]
        self.jobDescription = NSAttributedString(string: experience.work.description, attributes: jobDescriptionAttributes)
            
    }
    
    private func createDatesString(startDate: Date, endDate: Date?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyy"
        let startDateString = dateFormatter.string(from: startDate)
        
        var endDateString = String()
        if let endDate = endDate {
            endDateString = dateFormatter.string(from: endDate)
        } else {
            endDateString = "Currently"
        }
        return startDateString + " - " + endDateString
    }
}
