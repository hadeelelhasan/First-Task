//
//  TableViewCell.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 24/11/2021.
//

import UIKit

class AboutTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var aboutUserLabel: UILabel!
    
    var isExpanded: Bool {
        aboutUserLabel.numberOfLines == 0
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setIsExpanded(false)
    }
    
    func setIsExpanded(_ isExpanded: Bool ) {
        aboutUserLabel.numberOfLines = isExpanded ? 0 : 3
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        

    }

    /**
     Setup Cell
    - Parameter representable: User Table View Cell Representable
    */
    func setup(representable: AboutCellRepresentable) {
        // Set Full name label

        self.aboutUserLabel?.text = representable.AboutUser
        }
    
    /**
     Register Table Cell Viewt
     - Parameter tableView : Table View as UITableView
    */
    class func registerTableCellView(tableView: UITableView) {
        tableView.register(UINib(nibName: getNibName(), bundle: Bundle.main), forCellReuseIdentifier: getReuseIdentifier())
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
        return "AboutTableViewCell"
    }

    
    /**
     Get Nib Name
     - Returns: Nib Name as String
     */
    class func getNibName() -> String {
        return "AboutTableViewCell"
    }
}
