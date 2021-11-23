//
//  TableViewCellRepresentable.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 18/10/2021.
//

import UIKit

// MARK: - Table View Cell Representable
protocol TableViewCellRepresentable {
    
    /// Cell Height
    var cellHeight: CGFloat { get }
    
    /// Cell Reues Identifire
    var cellReuseIdentifire: String { get }
}

