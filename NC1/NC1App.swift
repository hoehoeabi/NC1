//
//  NC1App.swift
//  NC1
//
//  Created by 정용현 on 4/14/24.
//

import SwiftUI

@main
struct NC1App: App {
    var body: some Scene {
        WindowGroup {
//            MemoView(newDateStart: Date(), newDateEnd: Date())
            CalenderView(month: Date())
                .environmentObject(MemoViewModel())
        }
    }
}
