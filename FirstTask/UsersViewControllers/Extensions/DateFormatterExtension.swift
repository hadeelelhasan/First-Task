//
//  DateFormatterExtension.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 08/11/2021.
//

import Foundation

extension DateFormatter {
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, dd MMM yyyy HH:mm:ss zzz"
        return formatter
    }
}
