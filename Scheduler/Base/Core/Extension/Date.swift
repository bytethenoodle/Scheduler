//
//  Date.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import Foundation

extension Date {
    
    func year() -> Int {
        let calendar: Calendar = Calendar(identifier: .gregorian)
        return calendar.component(.year, from: self)
    }

    func month() -> Int {
        let calendar: Calendar = Calendar(identifier: .gregorian)
        return calendar.component(.month, from: self)
    }

    func day() -> Int {
        let calendar: Calendar = Calendar(identifier: .gregorian)
        return calendar.component(.day, from: self)
    }

    func weekday() -> Int {
        let calendar: Calendar = Calendar(identifier: .gregorian)
        return calendar.component(.weekday, from: self)
    }
    
    func startOfMonth() -> Date {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.year, .month], from: self)

        return calendar.date(from: components)!
    }
    
    func endOfMonth() -> Date {
        var components = DateComponents()
        components.month = 1
        components.second = -1
        return Calendar(identifier: .gregorian).date(byAdding: components, to: startOfMonth())!
    }
    
    func tomorrow() -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .day, value: 1, to: self)!
    }
    
    func yesterday() -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .day, value: -1, to: self)!
    }
    
    func nextMonth() -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .month, value: 1, to: self)!
    }
    
    func lastMonth() -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .month, value: -1, to: self)!
    }
    
    func datesOfMonth() -> [Date] {
        let start = startOfMonth()
        let end = endOfMonth()
        
        var dates = [Date]()
        var accumulator = start
        while accumulator < end {
            dates.append(accumulator)
            accumulator = accumulator.tomorrow()
        }
        return dates
    }
    
    func monthYearString() -> String {
        let df = DateFormatter()
        df.dateFormat = "MMMM yyyy"
        return df.string(from: Date())
    }
    
    func dateString() -> String {
        let df = DateFormatter()
        df.dateFormat = "MMMM dd, yyyy"
        return df.string(from: self)
    }
    
    func calendarArray() -> [Date?] {
        var dates = [Date?]()
        
        var initialWeekdateOffset = startOfMonth().weekday() - 1
        while initialWeekdateOffset > 0 {
            dates.append(nil)
            initialWeekdateOffset -= 1
        }
        
        dates.append(contentsOf: datesOfMonth())
        
        var endOfWeekdateOffset = 7 - endOfMonth().weekday()
        while endOfWeekdateOffset > 0 {
            dates.append(nil)
            endOfWeekdateOffset -= 1
        }
        
        return dates
    }
}
