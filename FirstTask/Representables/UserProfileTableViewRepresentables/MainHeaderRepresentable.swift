//
//  MainHeaderRepresentable.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 30/11/2021.
//

import UIKit

/// Student Header View Representable
class MainHeaderRepresentable: TableHeaderFooterViewRepresentable {
    
    /// View Height
    var viewHeight: CGFloat
    
    /// Resues Ideintifier
    var reuseIdentifier: String
    
    private(set) var backgraoundURL: String
    
    private(set) var profileImageURL: String
    
    private(set) var fullName: NSAttributedString
    
    private(set) var positionName: NSAttributedString
        
    
    /**
     Default Initializer
     */
    init() {
        self.viewHeight = MainHeaderTableView.getHeight()
        self.reuseIdentifier = MainHeaderTableView.getReuseIdentifier()
        self.backgraoundURL = String()
        self.profileImageURL = String()
        self.fullName = NSAttributedString()
        self.positionName = NSAttributedString()
    }
    
    
    /**
     Initializer
     - Parameter firstLetter: first  letter of student name
     */
    convenience init(userData: UserData) {
        self.init()
        
        backgraoundURL = "https://d7f8bv52wga7t.cloudfront.net/users/\(userData.userInfo.id)/user_background/\(userData.backgroundImage)/240_240.jpeg"
        profileImageURL = "https://d7f8bv52wga7t.cloudfront.net/users/\(userData.userInfo.id)/user_profile/\(userData.profileImage)/240_240.jpeg"
        
        let fullNameAttributes: [NSAttributedString.Key: Any] = [ .foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
                                                                  .font: UIFont.boldSystemFont(ofSize: 27)]
        
        fullName = NSAttributedString(string: userData.userInfo.firstName + " " + userData.userInfo.lastName, attributes: fullNameAttributes)
        
        let positionNameAttributes: [NSAttributedString.Key: Any] = [ .foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
                                                                  .font: UIFont.systemFont(ofSize: 14)]
        positionName = NSAttributedString(string: userData.currentJob, attributes: positionNameAttributes)
    }
}
