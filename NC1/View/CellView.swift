//
//  CellView.swift
//  NC1
//
//  Created by 정용현 on 4/30/24.
//

import SwiftUI

// MARK: - 일자 셀 뷰
struct CellView: View {
    var day: Int
    var clicked: Bool = false
    
    init(day: Int, clicked: Bool) {
        self.day = day
        self.clicked = clicked
    }
    
    var body: some View {
        VStack {
            if !clicked {
                Text(String(day))
            }
            else{
                ZStack{
                    Spacer()
                    Rectangle()
                        .opacity(0)//투명도 0~1 0이면 투명함
                        .overlay(Text(String(day)))
                        .foregroundColor(.black)
                        .background(Color(hex: 0xF5F5F5)).cornerRadius(10)
                    Text(String(day))
                }
            }
        }.frame(width: 40, height: 50)
    }
}

//#Preview {
//    CellView(day: Int, clicked: <#Bool#>)
//}
