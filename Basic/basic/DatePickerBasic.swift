//
//  DatePickerBasic.swift
//  Basic
//
//  Created by johyukjun on 10/3/24.
//

import SwiftUI

struct DatePickerBasic: View {
    // property
    @State var selectedDate1: Date = Date()
    @State var selectedDate2: Date = Date()
    @State var selectedDate3: Date = Date()
    @State var selectedDate4: Date = Date()
    @State var selectedDate5: Date = Date()
    
    var currentDate: String {
        let current = Date()
        let formatter = DateFormatter()
        
        // korea time
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        
        formatter.dateFormat = "yyyy-MM-dd a HH:mm:ss"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        
        return formatter.string(from: current)
    }
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        
        return formatter
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 20) {
                Text("\(currentDate)")
                
                Divider()
                
                VStack {
                    DatePicker("basic DatePicker", selection: $selectedDate1)
                        .accentColor(Color.red)
                        .datePickerStyle(.compact)
                    
                    Text("selected date: \(dateToKr(selectedDate: selectedDate1))")
                } // VStack
                
                Divider()
                
                VStack {
                    DatePicker("basic DatePicker", selection: $selectedDate2)
                        .accentColor(Color.red)
                        .datePickerStyle(.graphical)
                    
                    Text("selected date: \(dateToKr(selectedDate: selectedDate2))")
                } // VStack
                
                // .wheel option can't use in mac os
//                Divider()
//                
//                VStack {
//                    DatePicker("basic DatePicker", selection: $selectedDate3)
//                        .accentColor(Color.red)
//                        .datePickerStyle(.wheel)
//                    
//                    Text("selected date: \(dateToKr(selectedDate: selectedDate3))")
//                } // VStack
                
                Divider()
                
                VStack {
                    DatePicker("basic DatePicker", selection: $selectedDate4, displayedComponents: [.date])
                    
                    Text("selected date: \(dateToKr(selectedDate: selectedDate4))")
                } // VStack
                
                Divider()
                
                VStack {
                    DatePicker("basic DatePicker", selection: $selectedDate5, displayedComponents: [.hourAndMinute])
                    
                    Text("selected date: \(dateToKr(selectedDate: selectedDate5))")
                } // VStack
            } // VStack
        } // ScrollView
    } // body
    
    func dateToKr(selectedDate: Date) -> String {
        let formatter = DateFormatter()
        
        // korea time
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        
        formatter.dateFormat = "yyyy-MM-dd a HH:mm:ss"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        
        return formatter.string(from: selectedDate)
    }
}

#Preview {
    DatePickerBasic()
}
