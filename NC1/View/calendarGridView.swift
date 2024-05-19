//
//  calendarGridView.swift
//  NC1
//
//  Created by 정용현 on 5/2/24.
//

import SwiftUI

struct calendarGridView: View {
    @Binding var month: Date
    @Binding var clickedDates: Set<Date> 
    
    var body: some View {
        // MARK: - 날짜 그리드 뷰
        let daysInMonth: Int = CalenderView.numberOfDays(date: month)
        let firstWeekday: Int = CalenderView.firstWeekdayOfMonth(in: month) - 1
            
            return VStack {
                LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                    ForEach(0 ..< daysInMonth + firstWeekday, id: \.self) { index in
                        if index < firstWeekday {
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color.clear)
                        } else {
                            let date = getDate(for: index - firstWeekday)
                            let day = index - firstWeekday + 1
                            let clicked = clickedDates.contains(date)
                            
                            CellView(day: day, clicked: clicked)
                                .onTapGesture {
                                    if clicked {
                                        clickedDates.remove(date)
                                    } else {
                                        clickedDates.insert(date)
                                    }
                                }
                        }
                    }
                }
            }
        
        
    }
    func getDate(for day: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: day, to: startOfMonth())!
    }
    func startOfMonth() -> Date {
        let components = Calendar.current.dateComponents([.year, .month], from: month)
        return Calendar.current.date(from: components)!
    }
}


