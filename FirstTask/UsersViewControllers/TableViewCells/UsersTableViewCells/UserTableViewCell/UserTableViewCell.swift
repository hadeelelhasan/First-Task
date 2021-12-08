//
//  UserTableViewCell.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 18/10/2021.
//

import UIKit
import SDWebImage

// MARK: - User Table View Cell
class UserTableViewCell: UITableViewCell {

    /// FullName Label
    @IBOutlet private weak var fullNameLabel: UILabel!
    
    /// Breif information Label
    @IBOutlet private weak var breifInfoLabel: UILabel!
    
    /// Profile Picture
    @IBOutlet private weak var profilePicture: UIImageView!
        
    /**
     Awake Fron Nib
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        self.profilePicture.layer.cornerRadius = profilePicture.frame.height / 2

    }
            
    /**
     Setup Cell
    - Parameter representable: User Table View Cell Representable
    */
    func setup(representable: UserTableViewCellRepresentable) {
        // Set Full name label
        self.fullNameLabel.attributedText = representable.fullName
        
        // Set Breif info label
        self.breifInfoLabel.attributedText = representable.breifInfo
        
        // Set profile picture
        self.profilePicture.sd_setImage(with: URL(string: representable.profilePictureUrl), placeholderImage:  UIImage(imageLiteralResourceName: "defaultProfilePicture"), options: [])
        }
        

    
        
    
    /**
     Register Table Cell Viewt
     - Parameter tableView : Table View as UITableView
    */
    class func registerTableCellView(tableView: UITableView) {
        tableView.register(UINib(nibName: UserTableViewCell.getNibName(), bundle: Bundle.main), forCellReuseIdentifier: UserTableViewCell.getReuseIdentifier())
    }

    /**
     Get Cell Height
     - Returns: Height of cell as CGFloat
    */
    class func getHeight() -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    /**
     Get reues identifier for table view cell
     - Returns: reuse identifier for table view cell as String
     */
    class func getReuseIdentifier() -> String {
        return "UserTableViewCell"
    }

    
    /**
     Get Nib Name
     - Returns: Nib Name as String
     */
    class func getNibName() -> String {
        return "UserTableViewCell"
    }

    
}
