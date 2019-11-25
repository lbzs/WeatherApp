//
//  DateFormatter.swift
//  Weather
//
//  Created by Balint Zsombor Lakatos on 2019. 11. 24..
//  Copyright © 2019. Balint Zsombor Lakatos. All rights reserved.
//

import Foundation

class DateFormatterUtil {

    static private func helper() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_GB")
        return dateFormatter
    }

    static func getFormattedDate(_ date: Date) -> String {
        let dateFormatter = helper()
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMdd")
        return dateFormatter.string(from: date)
    }

    static func getFormattedHour(_ date: Date) -> String {
        let dateFormatter = helper()
        dateFormatter.setLocalizedDateFormatFromTemplate("ha")
        return dateFormatter.string(from: date)
    }
}
