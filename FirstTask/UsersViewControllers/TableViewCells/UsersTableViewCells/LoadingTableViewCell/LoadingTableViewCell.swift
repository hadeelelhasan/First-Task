//
//  LoadingTableViewCell.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 21/10/2021.
//

import UIKit

// MARK: - Loading Table View Cell
class LoadingTableViewCell: UITableViewCell {

    /// Loader
    @IBOutlet private weak var loader: UIActivityIndicatorView!
    
    /// Loading Label
    @IBOutlet private weak var loadingLabel: UILabel!
        
    
    /**
     Awake From Nib
    */
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /**
     Setup
     - Parameter representable: Loading Table View Cell Representable as LoadingTableViewCellRepresentable
    */
    func setup(representable: LoadingTableViewCellRepresentable) {
        self.loadingLabel.attributedText = representable.LoadingString
        self.loader.color = #colorLiteral(red: 0.2916044295, green: 0.5656878948, blue: 0.8853569627, alpha: 1)
        self.loader.startAnimating()
    }
    
    /**
     Register Loading Table Cell View
     - Parameter tableView: Table View as UITableView
     */
    class func registerLaodingTableCellView(tableView: UITableView) {
        tableView.register(UINib(nibName: LoadingTableViewCell.getNibName(), bundle: Bundle.main), forCellReuseIdentifier: LoadingTableViewCell.getReuseIdentifier())
    }
    
    /**
     Get Reusable Identifier
     - Returns: Reusable Identifier as string
     */
    class func getReuseIdentifier() -> String {
        return "LoadingTableViewCell"
    }
    
    
    /**
     Get Nib Name
     - Returns: NibName as string
     */
    class func getNibName() -> String {
        return "LoadingTableViewCell"
    }

    /**
     Get Cell Height
     - Returns: Cell Height as CGFloat
     */
    class func getHeight() -> CGFloat {
        return UITableView.automaticDimension
    }
}
