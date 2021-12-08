//
//  TableHeaderFooterViewRepresentable.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 24/11/2021.
//

import UIKit

/// Table Header Footer View Representable
protocol TableHeaderFooterViewRepresentable {
    
    /// View Height
    var viewHeight: CGFloat { get set }
    
    /// View Resue Identifier
    var reuseIdentifier: String { get set }
}
