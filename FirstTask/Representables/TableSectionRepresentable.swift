//
//  TableSectionRepresentable.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 24/11/2021.
//

import Foundation

/// Table Section Representable
class TableSectionRepresentable {
    
    /// Sectoin Header Representable
    var sectionHeaderRepresentable: TableHeaderFooterViewRepresentable?
    
    /// Cells Representable
    var cellsRepresentables: [TableViewCellRepresentable]
    
    /**
     Default Initializer
    */
    init() {
        self.sectionHeaderRepresentable = nil
        self.cellsRepresentables = []
    }
}
