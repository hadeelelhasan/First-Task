//
//  UserTableViewCellRepresentable.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 18/10/2021.
//

import UIKit
import SDWebImage

// MARK: - User Table View Cell Representable
class UserTableViewCellRepresentable: TableViewCellRepresentable {
 
    /// Cell Height
    var cellHeight: CGFloat
    
    /// Cell Reuse Identifire
    var cellReuseIdentifire: String
    
    /// Name
    private(set) var fullName: NSAttributedString
    
    /// Breif Information
    private(set) var breifInfo: NSAttributedString
    
    /// Profile Picture url
    private(set) var profilePictureUrl: String

    private(set) var id: Int
    /**
     Default Initializer
    */
    init() {
        self.cellHeight = UserTableViewCell.getHeight()
        self.cellReuseIdentifire = UserTableViewCell.getReuseIdentifier()
        self.fullName = NSAttributedString()
        self.breifInfo = NSAttributedString()
        self.profilePictureUrl = String()
        self.id = Int()
    }


    /**
     Initializer
     - Parameter user: user as Result
     */
    convenience init(user: User) {
        self.init()
        
        /// Name Attributes
        let fullNameAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: #colorLiteral(red: 0.2916044295, green: 0.5656878948, blue: 0.8853569627, alpha: 1),
                                                             .font: UIFont.boldSystemFont(ofSize: 14)]
        // Set Full Name user.firstName + " " + user.lastName
        self.fullName = NSAttributedString(string: user.firstName + " " + user.lastName, attributes: fullNameAttributes)
        
        /// LookingForJob Attributes
        let lookingForJobAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: #colorLiteral(red: 0.290160656, green: 0.2902164459, blue: 0.2901571095, alpha: 1),
        .font: UIFont.italicSystemFont(ofSize: 12)]
        
        // Set Breif Information if there is no postions
        if user.positions.count == 0 {
            self.breifInfo = NSAttributedString(string: "is Looking for thier first job", attributes: lookingForJobAttributes)
        } else {
            
            /// Postions String
            var positoinsString = ""
            for position in user.positions {
                positoinsString += "\(position.name), "
             }
            
            /// Postions Atrributes
            let positionsAttributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: positoinsString , attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), .font: UIFont.boldSystemFont(ofSize: 14)]))
            
            /// Location Atrributes
            let locationAtrributes: [NSAttributedString.Key: Any] = [.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),.font: UIFont.systemFont(ofSize: 14)]
            
            // append location Atrributes
            positionsAttributedString.append(NSAttributedString(attributedString: NSAttributedString(string: user.location.city , attributes: locationAtrributes)))
            
            // Set Breif Information if there is  postions
            self.breifInfo = positionsAttributedString
        }

        
        // Set profile Picture
           self.profilePictureUrl = "https://d7f8bv52wga7t.cloudfront.net/users/\(user.id)/user_profile/\(user.profileImageUUID)/240_240.jpeg"
        
        self.id = user.id
    }
    
    
    
    
    

}

