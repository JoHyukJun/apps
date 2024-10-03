//
//  StepperBasic.swift
//  Basic
//
//  Created by johyukjun on 10/3/24.
//

import SwiftUI

struct StepperBasic: View {
    // property
    @State var stepperVal: Int = 0
    @State var widthChange: CGFloat = 0
    
    var body: some View {
        VStack {
            Stepper("basic stepper: \(stepperVal)", value: $stepperVal)
                .padding()
            
            Divider()
            
            RoundedRectangle(cornerRadius: 24.0)
                .frame(width: 100 + widthChange, height: 100)
            
            Stepper("rectangle width change") {
                // increment
                diffWidth(amount: 20)
            } onDecrement: {
                // decrement
                diffWidth(amount: -20)
            }
        } // VStack
        
    } // body
    
    func diffWidth(amount: CGFloat) {
        withAnimation(.easeInOut) {
            widthChange += amount
        }
    }
}

#Preview {
    StepperBasic()
}
