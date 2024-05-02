//
//  File.swift
//  NC1
//
//  Created by 정용현 on 4/15/24.
//

import SwiftUI
struct File : View {
    @State var selected : Set<DateComponents> = []
    var body: some View {
        MultiDatePicker("Select Dates", selection: $selected)
                            //.foregroundColor(.red)
                            .datePickerStyle(.compact)
                            .frame(height: 500)

    }
}
#Preview {
    File()
}
