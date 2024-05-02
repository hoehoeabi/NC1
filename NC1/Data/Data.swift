//
//  Data.swift
//  NC1
//
//  Created by 정용현 on 4/14/24.
//

import Foundation

struct Memo: Codable, Identifiable {
    var id = UUID()
    let titleMemo : String
    let planMemo : String
    let dateStart : Date
    let dateEnd : Date
}

class MemoViewModel: ObservableObject {
    @Published var memoModel: [Memo] = []
    
    func update(id: UUID, newMemo: Memo) {
        if let index = memoModel.firstIndex(where: { $0.id == id }) {
                    memoModel[index] = newMemo
                }
    }
    
    func delete(id: UUID) {
        if let index = memoModel.firstIndex(where: { $0.id == id }) {
            memoModel.remove(at: index)
        }
    }
    
        func saveData() {
            let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("memo.json")
            if let data = try? JSONEncoder().encode(memoModel) {
                try? data.write(to: fileURL)
            }
        }
    
        func loadData() {
            let fileURL = getDocumentsDirectory().appendingPathComponent("memo.json")
            if let data = try? Data(contentsOf: fileURL) {
                if let decoded = try? JSONDecoder().decode([Memo].self, from: data) {
                    self.memoModel = decoded
                }
            }
        }

    
        func getDocumentsDirectory() -> URL {
            FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        }
    
}
