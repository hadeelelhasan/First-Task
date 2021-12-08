//
//  UserInfoHeaderViewRepresentable.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 24/11/2021.
//

import UIKit

/// Student Header View Representable
class SectionHeaderRepresentable: TableHeaderFooterViewRepresentable {
    
    /// View Height
    var viewHeight: CGFloat
    
    /// Resues Ideintifier
    var reuseIdentifier: String
    
    private(set) var headerTitle: NSAttributedString
    
    /**
     Default Initializer
     */
    init() {
        self.viewHeight = SectionHeaderTableView.getHeight()
        self.reuseIdentifier = SectionHeaderTableView.getReuseIdentifier()
        self.headerTitle = NSAttributedString()
    }
    
    
    /**
     Initializer
     - Parameter firstLetter: first  letter of student name
     */
    convenience init(headerTitle: String) {
        self.init()
        
        let headerTitleAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                                                   .font: UIFont.systemFont(ofSize: 16)]
        // set Header title
        self.headerTitle = NSAttributedString(string: headerTitle.capitalized, attributes: headerTitleAttributes)
    }
}
