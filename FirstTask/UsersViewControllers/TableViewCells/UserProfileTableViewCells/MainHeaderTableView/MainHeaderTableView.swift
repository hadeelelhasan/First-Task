//
//  MainHeaderTableView.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 30/11/2021.
//

import UIKit
import SDWebImage

class MainHeaderTableView: UITableViewHeaderFooterView {

    var backgroundImage = UIImageView()
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var positionNameLabel: UILabel!
    
    @IBOutlet weak var locationIcon: UIButton!
    
    @IBOutlet weak var commentIcon: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.profileImage.layer.cornerRadius = profileImage.frame.height / 2
        self.profileImage.layer.borderWidth = 2
        self.profileImage.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)


        self.locationIcon.setImage(#imageLiteral(resourceName: "share"), for: .normal)
        self.locationIcon.layer.cornerRadius = locationIcon.frame.height / 2
        self.locationIcon.layer.borderWidth = 1
        self.locationIcon.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.locationIcon.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

        
        self.commentIcon.setImage(#imageLiteral(resourceName: "comment"), for: .normal)
        self.commentIcon.layer.cornerRadius = commentIcon.frame.height / 2
        self.commentIcon.layer.borderWidth = 1
        self.commentIcon.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.commentIcon.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    
    
  
    
    class func registerHeaderView(tableView: UITableView) {
        tableView.register(UINib(nibName: getReuseIdentifier() , bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: getReuseIdentifier())
    }
    
    
    /**
     Setup Header Cell
     - Parameter representable: Representable for table view header
    */
    func setup(representable: MainHeaderRepresentable) {
        self.backgroundImage.sd_setImage(with: URL(string: representable.backgraoundURL), placeholderImage: #imageLiteral(resourceName: "defaultProfilePicture"), options: [])
        self.profileImage.sd_setImage(with: URL(string: representable.profileImageURL), placeholderImage: #imageLiteral(resourceName: "defaultProfilePicture"), options:  [])
        self.backgroundView = backgroundImage
        self.fullNameLabel.attributedText = representable.fullName
        self.positionNameLabel.attributedText = representable.positionName
    }
    
    
    /**
     Get Height for table view header
     - Returns: height of table view header as CGFloat
     */
    class func getHeight() -> CGFloat {
        return UITableView.automaticDimension
    }
    
    /**
     Get reues identifier for table view header
     - Returns: reuse identifier for table view header as String
     */
    class func getReuseIdentifier() -> String {
        return "MainHeaderTableView"
    }

    
}
