//
//  SectionHeaderTableView.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 24/11/2021.
//

import UIKit

class SectionHeaderTableView: UITableViewHeaderFooterView {

    /// Header Label
    @IBOutlet weak var headerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    class func registerHeaderView(tableView: UITableView) {
        tableView.register(UINib(nibName: getReuseIdentifier() , bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: getReuseIdentifier())
    }
    
    
    /**
     Setup Header Cell
     - Parameter representable: Representable for table view header
    */
    func setup(representable: SectionHeaderRepresentable) {
        
        // Set Header Label
        self.headerLabel.attributedText = representable.headerTitle
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
        return "SectionHeaderTableView"
    }
}
