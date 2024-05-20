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
        //_ = calendar.dateComponents([.month], from: self)
        return calendar.date(byAdding: .month, value: value, to: self) ?? .now
//        if let newMonth = calendar.date(byAdding: .month, value: value, to: component.month) {
//            self.month = newMonth
//        }
    }
//    func changeMonth(by value: Int) -> Date {
//        let calendar = Calendar.current
//        var components = calendar.dateComponents([.month], from: self)
//        if let newMonth = calendar.date(byAdding: .month, value: value, to: self) {
//            components.month = calendar.component(.month, from: newMonth)
//            return newMonth
//        }
//        return Date() // 에러 처리 등에 따라 다른 값을 반환할 수도 있음
//    }
}

