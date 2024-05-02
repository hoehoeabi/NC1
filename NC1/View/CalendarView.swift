//
//  ContentView.swift
//  NC1
//
//  Created by 정용현 on 4/14/24.
//

import SwiftUI

struct CalenderView: View {
    @State var month: Date
    @State var offset: CGSize = CGSize()
    @State var clickedDates: Set<Date> = []
    @EnvironmentObject var viewModel: MemoViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                headerView(month: $month)
                calendarGridView(month: $month, clickedDates: $clickedDates)
                Spacer()
                dayMemoView(clickedDates: $clickedDates)
            }
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        self.offset = gesture.translation
                    }
                    .onEnded { gesture in
                        if gesture.translation.width < -100 {
//                            changeMonth(by: 1)
                            month = month.changeMonth(by: 1)
                        } else if gesture.translation.width > 100 {
                            month = month.changeMonth(by: -1)
                        }
                        self.offset = CGSize()
                    }
            )
        }
    }
    
    
    
    
}


struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        //.environmentObject(UserSetting()) 추가
        CalenderView(month: .now).environmentObject(MemoViewModel())
    }
}
