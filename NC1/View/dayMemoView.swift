//
//  dayMemoView.swift
//  NC1
//
//  Created by 정용현 on 4/30/24.
//

import SwiftUI

struct dayMemoView: View{
    @EnvironmentObject var viewModel: MemoViewModel
    @Binding var clickedDates: Set<Date>
    
    var body: some View{
        VStack {
            Divider().foregroundColor(.black)
            
            HStack{
                //Text("\(clickYear)/\(clickMonth)/\(clickDay)")
                Text("\(getDate(), formatter: DateFormatter.dateFormatterDay)").font(.headline).padding(.leading,10)
                
                Spacer()
            }
            HStack{
                NavigationLink(destination: MemoView(newDateStart: .now, newDateEnd: .now)){
                    Image(systemName: "plus").foregroundColor(.black).frame(width : 20 , height: 20).font(.title)
                }
                Text("새로운 이벤트").foregroundColor(.black).padding(.leading,10)
                Spacer()
            }.padding(.leading,10).frame(height:40).background(Color(hex: 0xF5F5F5)).cornerRadius(10)
            
            List{
                // TODO: 메모 모델의 start date == clickedDate 같은 것만 필터링 하면 됨
                ForEach(viewModel.memoModel) { memo in
                    if true{
                        
                        let calendar = Calendar.current
                        let startHour = calendar.component(.hour, from: memo.dateStart)  // 현재 시간
                        let startMinute = calendar.component(.minute, from: memo.dateStart)
                        let endHour = calendar.component(.hour, from: memo.dateEnd)  // 현재 시간
                        let endMinute = calendar.component(.minute, from: memo.dateEnd)
                        
                        if memo.dateStart.isSameDay(as: getDate()) {
                            NavigationLink(destination: MemoView(id: memo.id,newTitleMemo: memo.titleMemo, newPlanMemo:memo.planMemo, newDateStart: memo.dateStart, newDateEnd: memo.dateEnd)){
                                HStack(){
                                    VStack{
                                        Text("\(startHour) : \(startMinute)")
                                        Text("\(endHour) : \(endMinute)")
                                        //                                    Text("\(memo.dateStart)")
                                        //                                    Text("\(memo.dateEnd)")
                                    }
                                    Image(systemName: "rectangle.portrait.fill").resizable().frame(width:4,height:35).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).padding(.leading,5)
                                    Text("\(memo.titleMemo)")
                                }
                            }
                        }
                    }
                }
            }
            .frame(height: 250)
            .onAppear(perform: viewModel.loadData)
        }
    }
    
    func getDate() -> Date {
        if clickedDates.isEmpty {
            return Date()
        } else {
            return Array(clickedDates)[0]
        }
    }
}

struct dayMemoView_Previews: PreviewProvider {
    
    static var previews: some View {
        dayMemoView(clickedDates: .constant([Date()])).environmentObject(MemoViewModel())
    }
}
