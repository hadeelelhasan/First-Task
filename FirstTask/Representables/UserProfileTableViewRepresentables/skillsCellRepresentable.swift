//
//  skillsTableViewCellRepresentable.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 24/11/2021.
//

import UIKit

class SkillsCellRepresentable: TableViewCellRepresentable {
    var cellHeight: CGFloat
    
    var cellReuseIdentifire: String
    
    private(set) var userSkillsStrings: [NSAttributedString]
    
    init() {
        self.cellHeight = SkillsTableViewCell.getHeight()
        self.cellReuseIdentifire = SkillsTableViewCell.getReuseIdentifier()
        self.userSkillsStrings = []
    }
    
    convenience init(userSkills: [UserSkill]) {
        self.init()
        let userSkillsAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: #colorLiteral(red: 0.2916044295, green: 0.5656878948, blue: 0.8853569627, alpha: 1),
                                                                   .font: UIFont.boldSystemFont(ofSize: 14)]
       
        userSkillsStrings = userSkills.map({ userSkill in
            let checkIcon = NSTextAttachment()
            checkIcon.image = #imageLiteral(resourceName: "CHECK SKILLS")
            let skillFullText = NSMutableAttributedString(attachment: checkIcon)
            skillFullText.append(NSAttributedString(string: " " + userSkill.name, attributes: userSkillsAttributes))
            return skillFullText
        })
    }
}
