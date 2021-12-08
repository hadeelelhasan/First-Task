//
//  ExperienceTableViewCell.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 25/11/2021.
//

import UIKit

class ExperienceTableViewCell: UITableViewCell {
    
    /// Dates Label
    @IBOutlet weak var datesLabel: UILabel!
    
    /// Position
    @IBOutlet weak var positionLabel: UILabel!
    
    /// Brand Name
    @IBOutlet weak var brandNameLabel: UILabel!
    
    /// Position Description
    @IBOutlet weak var jobDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /**
     Setup Cell
    - Parameter representable: User Table View Cell Representable
    */
    func setup(representable: ExperienceCellRepresentable) {
        datesLabel.attributedText = representable.dates
        positionLabel.attributedText = representable.position
        brandNameLabel.attributedText = representable.brandName
        jobDescriptionLabel.attributedText = representable.jobDescription
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
        return "ExperienceTableViewCell"
    }

    
    /**
     Get Nib Name
     - Returns: Nib Name as String
     */
    class func getNibName() -> String {
        return "ExperienceTableViewCell"
    }



    
}
