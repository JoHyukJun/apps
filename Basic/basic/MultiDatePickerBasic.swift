//
//  MultiDatePickerBasic.swift
//  Basic
//
//  Created by johyukjun on 10/15/24.
//

import SwiftUI

struct MultiDatePickerBasic: View {
    // property
    @State private var dates: Set<DateComponents> = []
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Multi Date Picker")
                .font(.largeTitle.bold())
                .foregroundStyle(.blue)
            
            // DO NOT SUPPORT MAC OS
//            MultiDatePicker("Date Picker", selection: $dates)
//                .frame(height: 400)
//                .tint(.red)
            
            
            List {
                Section("Selected dates") {
                    ForEach(Array(dates), id: \.self) { date in
                        Text("\(date.month!)월 \(date.day!)일")
                    }
                }
            }
            .font(.title)
            
            Spacer()
        }
    }
}

struct MultiDatePickerSheet: View {
    // property
    @State private var dates: Set<DateComponents> = []
    @State private var showSheet: Bool = false
    
    private var sortedDates: [String] {
        dates.sorted { date1, date2 in
            date1.day! < date2.day!
        }
        .map { date in
            "\(date.month!)월 \(date.day!)일"
        }
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Multi Date Sheet")
                .font(.largeTitle.bold())
                .foregroundStyle(.blue)
            
            Button("Open calendar") {
                showSheet.toggle()
            }
            .buttonStyle(.borderedProminent)
            
            List {
                Section("Selected dates") {
                    ForEach(sortedDates, id: \.self) { date in
                        Text(date)
                    }
                }
            }
            
            Spacer()
        }
        .sheet(isPresented: $showSheet) {
            VStack {
//                MultiDatePicker("Sheet", selection: $dates)
                
                Button("Done") {
                    showSheet.toggle()
                }
                .buttonStyle(.borderedProminent)
            }
            .presentationDetents([.medium])
        }
    }
}

#Preview {
    MultiDatePickerBasic()
}

#Preview("MultiDatePickerSheet") {
    MultiDatePickerSheet()
}
