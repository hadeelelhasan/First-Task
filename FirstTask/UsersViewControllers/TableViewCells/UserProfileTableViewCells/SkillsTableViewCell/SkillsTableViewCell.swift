//
//  SkillsTableViewCell.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 28/11/2021.
//

import UIKit

class SkillsTableViewCell: UITableViewCell {

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
       
    }
    
    /**
     Setup Cell
    - Parameter representable: Skills Cell Representable
    */
    func setup(representable: SkillsCellRepresentable) {
        
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        var originX: CGFloat = 10
        var originY: CGFloat = 10
        var previousLabel: UITagLabel?
        
        for skill in representable.userSkillsStrings {
            let skillLabel = UITagLabel()
            
            skillLabel.attributedText = skill
            let labelSize = skillLabel.sizeThatFits(CGSize.zero)
            
            if let previous = previousLabel {
                originX = originX + previous.frame.width + 10

                if (originX + labelSize.width + 10)  >= self.bounds.width {
                    originX = 10
                    originY = originY + previous.frame.height + 10
                }
            }
            skillLabel.frame = CGRect(origin: CGPoint(x: originX, y: originY), size: labelSize)
            previousLabel = skillLabel
            
            self.contentView.addSubview(skillLabel)
        }
        
        representable.cellHeight = originY + (previousLabel?.frame.height ?? 0.0) + 20
    }
    
  /** Register Table Cell Viewt
    - Parameter tableView : Table View as UITableView
   */
   class func registerTableCellView(tableView: UITableView) {
    tableView.register(SkillsTableViewCell.self, forCellReuseIdentifier: getReuseIdentifier())
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
       return "SkillsTableViewCell"
   }

   
   /**
    Get Nib Name
    - Returns: Nib Name as String
    */
   class func getNibName() -> String {
       return "SkillsTableViewCell"
   }


    
}

