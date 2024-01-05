//
//  Calendar+Extensions.swift
//  CombineWithNBA
//
//  Created by Isaac Perez on 1/4/24.
//

import Foundation

extension Calendar {
    /// Gets all days in the current week as an array of formatted strings.
    ///
    /// - Returns: An array of formatted date strings (yyyy-MM-dd) representing each day in the current week.
    func getAllDaysInCurrentWeek() -> [String] {
        let today = startOfDay(for: Date())
        
        guard let dayOfWeek = range(of: .weekday, in: .weekOfYear, for: today)?.first else {
            return []
        }

        let dates = (0..<7).compactMap { offset in
            date(byAdding: .day, value: offset - dayOfWeek, to: today)?.startOfDay
        }.map {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: $0)
        }
        
        return dates
    }
}

extension Date {
    /// Returns the start of the day for the given date.
    ///
    /// - Returns: A new date representing the start of the day for the current date.
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
}
