//
//  AvailabilityTableViewCell.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 02/12/2021.
//

import UIKit

class AvailabilityTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    override func prepareForReuse() {
        super.prepareForReuse()
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
    }
    
    
    /**
     Setup Cell
    - Parameter representable: Skills Cell Representable
    */
    func setup(representable: AvailabilityCellRepresentable) {
        
        var originX: CGFloat = 10
        var originY: CGFloat = 10
        var previousLabel: UITagLabel?
        
        for availability in representable.availabilities {
            let availabilityLabel = UITagLabel()
            
            availabilityLabel.attributedText = availability
            let labelSize = availabilityLabel.sizeThatFits(CGSize.zero)
            
            if let previous = previousLabel {
                originX = originX + previous.frame.width + 10

                if (originX + labelSize.width + 10)  >= self.bounds.width {
                    originX = 10
                    originY = originY + previous.frame.height + 10
                }
            }
            availabilityLabel.frame = CGRect(origin: CGPoint(x: originX, y: originY), size: labelSize)
            previousLabel = availabilityLabel
            
            self.contentView.addSubview(availabilityLabel)
        }
        
        representable.cellHeight = originY + (previousLabel?.frame.height)! + 20
    }
    
  /** Register Table Cell Viewt
    - Parameter tableView : Table View as UITableView
   */
   class func registerTableCellView(tableView: UITableView) {
    tableView.register(AvailabilityTableViewCell.self, forCellReuseIdentifier: getReuseIdentifier())
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
       return "AvailabilityTableViewCell"
   }

   /**
    Get Nib Name
    - Returns: Nib Name as String
    */
   class func getNibName() -> String {
       return "AvailabilityTableViewCell"
   }
}
