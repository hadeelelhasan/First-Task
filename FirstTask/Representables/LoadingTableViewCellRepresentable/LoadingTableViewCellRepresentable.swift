//
//  LoadingTableViewCellRepresentable.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 21/10/2021.
//

import UIKit

// MARK: - Loading Table View Cell Representable
class LoadingTableViewCellRepresentable: TableViewCellRepresentable {
    
    /// Cell Height
    var cellHeight: CGFloat
    
    /// Cell Resuable Identifier
    let cellReuseIdentifire: String
    
    /// has Data
    var hasData: Bool
    
    /// Default Cell Height
    private let defaultCellHeight: CGFloat
    
    /// Loading String
    private(set) var LoadingString: NSAttributedString
    
    
    /**
     Default Initializer
    */
    init() {
        self.defaultCellHeight = LoadingTableViewCell.getHeight()
        self.cellHeight = LoadingTableViewCell.getHeight()
        self.cellReuseIdentifire = LoadingTableViewCell.getReuseIdentifier()
        self.hasData = false
        self.LoadingString = NSAttributedString(string: "Loading", attributes: [.foregroundColor: UIColor(cgColor: #colorLiteral(red: 0.2916044295, green: 0.5656878948, blue: 0.8853569627, alpha: 1)), .font: UIFont.boldSystemFont(ofSize: 14)])
    }
    
    convenience init(hasData: Bool) {
        self.init()
        self.hasData = hasData
    }
}
