//
//  MemoView.swift
//  NC1
//
//  Created by 정용현 on 4/14/24.
//

import Foundation
import SwiftUI



struct MemoView : View{
    //@State var titleMemo : String = ""
    //@State var planMemo : String = ""
    //@State var dateStart = Date()
    //@State var dateEnd = Date()
    @EnvironmentObject var viewModel: MemoViewModel
    @Environment(\.dismiss) private var dismiss

    var id: UUID?
    
    
    @State var newTitleMemo: String = ""
    @State var newPlanMemo: String = ""
    @State var newDateStart: Date
    @State var newDateEnd: Date
    @State var saveAlert = false
    @State var deleteAlert = false
    var body: some View{
        VStack{
            Spacer()
            HStack{
                Spacer()
                TextField("제목", text : $newTitleMemo)
                    .font(.title).lineLimit(1)
            }
            HStack{
                Spacer()
                VStack{
                    DatePicker(
                        "시작",
                        selection: $newDateStart,
                        displayedComponents: [.date, .hourAndMinute]
                    )
                    DatePicker(
                        "끝",
                        selection: $newDateEnd,
                        displayedComponents: [.date, .hourAndMinute]
                    )
                }
            }
            HStack{
                Spacer()
                TextEditor(text : $newPlanMemo).font(.title)
            }
            Spacer()
            HStack{
                Button("저장") {
                    saveAlert = true
                    if let id = id { 
                        let fixMemo = Memo(titleMemo: newTitleMemo, planMemo: newPlanMemo, dateStart: newDateStart, dateEnd: newDateEnd)
                        viewModel.update(id: id, newMemo: fixMemo)
                    }
                    else{
                        let newMemo = Memo(titleMemo: newTitleMemo, planMemo: newPlanMemo, dateStart: newDateStart, dateEnd: newDateEnd)
                        viewModel.memoModel.append(newMemo)
                    }
                }.foregroundStyle(.black).padding(.leading,70)
                    .alert("저장되었습니다", isPresented: $saveAlert) {
                        Button("오냐", role: .cancel) {
                            // NavigationView가 Dismiss되도록
                            // TODO: Dismiss 키워드 알아보기
                            viewModel.saveData()
                            dismiss()
                        }
                    }
                Spacer()
                Button("삭제") {
                    if let id = id {
                        deleteAlert = true
                        _ = Memo(titleMemo: newTitleMemo, planMemo: newPlanMemo, dateStart: newDateStart, dateEnd: newDateEnd)
                        viewModel.delete(id: id)
                    }
                }.foregroundStyle(.red).padding(.trailing,70)
                    .alert("삭제되었습니다", isPresented: $deleteAlert) {
                        Button("힝...", role: .cancel) {
                            if id != nil {
                                viewModel.saveData()
                                }
                            dismiss()
                        }
                    }
            }
        }
        .onAppear(perform: viewModel.loadData)
    }
}



struct MemoView_Previews: PreviewProvider {
    static var previews: some View {
        //.environmentObject(UserSetting()) 추가
        MemoView(newDateStart: .now, newDateEnd: .now).environmentObject(MemoViewModel())
    }
}
