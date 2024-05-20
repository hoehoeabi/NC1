//
//  CalenderView+.swift
//  NC1
//
//  Created by 정용현 on 4/30/24.
//

import SwiftUI

// MARK: - Static 프로퍼티
extension CalenderView {
    
    static let weekdaySymbols =
    ["일", "월", "화", "수", "목", "금", "토"]
    
    /// 특정 해당 날짜
    func getDate(for day: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: day, to: startOfMonth())!
    }
    
    /// 해당 월의 시작 날짜
    func startOfMonth() -> Date {
        let components = Calendar.current.dateComponents([.year, .month], from: month)
        return Calendar.current.date(from: components)!
    }
    
    /// 해당 월에 존재하는 일자 수
    static func numberOfDays(date: Date) -> Int {
        return Calendar.current.range(of: .day, in: .month, for: date)?.count ?? 0
    }
    
    /// 해당 월의 첫 날짜가 갖는 해당 주의 몇번째 요일
    static func firstWeekdayOfMonth(in date: Date) -> Int {
        let components = Calendar.current.dateComponents([.year, .month], from: date)
        let firstDayOfMonth = Calendar.current.date(from: components)!
        
        return Calendar.current.component(.weekday, from: firstDayOfMonth)
    }
    
    /// 월 변경
//    func changeMonth(by value: Int) {
//        let calendar = Calendar.current
//        if let newMonth = calendar.date(byAdding: .month, value: value, to: month) {
//            self.month = newMonth
//        }
//    }
    
}
