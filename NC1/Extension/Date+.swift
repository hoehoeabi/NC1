//
//  Date+.swift
//  NC1
//
//  Created by 정용현 on 4/30/24.
//

import SwiftUI

extension Date {
    func isSameDay(as otherDate: Date) -> Bool {
        let calendar = Calendar.current
        let components1 = calendar.dateComponents([.year, .month, .day], from: self)
        let components2 = calendar.dateComponents([.year, .month, .day], from: otherDate)
        return components1.year == components2.year &&
               components1.month == components2.month &&
               components1.day == components2.day
    }
    
    func changeMonth(by value: Int) -> Date {
        let calendar = Calendar.current
        _ = calendar.dateComponents([.month], from: self)
        return calendar.date(byAdding: .month, value: value, to: self) ?? .now
//        if let newMonth = calendar.date(byAdding: .month, value: value, to: component.month) {
//            self.month = newMonth
//        }
    }
}

