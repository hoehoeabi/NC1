//
//  headerView.swift
//  NC1
//
//  Created by 정용현 on 5/2/24.
//

import SwiftUI

struct headerView: View {
    @Binding var month: Date
    @EnvironmentObject var viewModel: MemoViewModel
    // MARK: - 헤더 뷰
    var body : some View {
        VStack {
            HStack{
                HStack {
                    Text(month, formatter: DateFormatter.dateFormatter)
                        .font(.title)
                        .padding(.leading,10)
                    Button {
                        month = month.changeMonth(by: -1)
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                    Button {
                        month = month.changeMonth(by: 1)
                    } label: {
                        Image(systemName: "chevron.right")
                    }
                }
                Spacer()
                Image(systemName: "magnifyingglass")
                Image(systemName: "gearshape").padding(.trailing,5)
            }.padding(.bottom)
            
            
            HStack {
                ForEach(CalenderView.weekdaySymbols, id: \.self) { symbol in
                    if (symbol == "일"){
                        Text(symbol)
                            .frame(maxWidth: .infinity).foregroundColor(.red)
                    }else if (symbol == "토"){
                        Text(symbol)
                            .frame(maxWidth: .infinity).foregroundColor(.blue)
                    }else{
                        Text(symbol)
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding(.bottom, 5)
        }
    }
}

struct headerView_Previews: PreviewProvider {
    static var previews: some View {
        headerView(month: .constant(Date())).environmentObject(MemoViewModel())
    }
}
