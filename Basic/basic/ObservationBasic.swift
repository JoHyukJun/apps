//
//  ObservationBasic.swift
//  Basic
//
//  Created by johyukjun on 10/30/24.
//

import SwiftUI

struct ObservationBasic: View {
    // property
    @EnvironmentObject private var vm1: UserObservableObject
    @Environment(UserObservableMacro.self) private var vm2
    
    var body: some View {
        // @Bindable 을 통해 body 와 연결해서 사용
        @Bindable var vm2 = vm2
        
        VStack(spacing: 30) {
            Text("VM comp")
                .font(.title)
            
            HStack {
                Menu("\(vm1.name): \(vm1.number)") {
                    ForEach(10..<20) { idx in
                        Button(String(idx)) {
                            vm1.number = idx
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                
                Spacer()
                
                Toggle("VM1 Toggle", isOn: $vm1.isClick)
            } // HStack
            
            HStack {
                Menu("\(vm2.name): \(vm2.number)") {
                    ForEach(10..<20) { idx in
                        Button(String(idx)) {
                            vm2.number = idx
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                
                Spacer()
                
                Toggle("VM2 Toggle", isOn: $vm2.isClick)
            } // HStack
            
            Divider()
            
            Text("SubView Comp")
                .font(.title)
            
            // BindingView1 Connect - @ObservedObject
            BindingView1(vm1: vm1)
            
            // BindingView2 Connect - @Bindable
            BindingView2(vm2: vm2)
        } // VStack
        .font(.title2)
        .padding()
    }
}

// MARK: - SubView
struct BindingView1: View {
    // property
    @ObservedObject var vm1: UserObservableObject
    
    var body: some View {
        HStack {
            Menu("\(vm1.name): \(vm1.number)") {
                ForEach(10..<20) { idx in
                    Button(String(idx)) {
                        vm1.number = idx
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            
            Spacer()
            
            Toggle("VM1 Toggle", isOn: $vm1.isClick)
        } // HStack
    }
}

struct BindingView2: View {
    // property
    @Bindable var vm2: UserObservableMacro
    
    var body: some View {
        HStack {
            Menu("\(vm2.name): \(vm2.number)") {
                ForEach(10..<20) { idx in
                    Button(String(idx)) {
                        vm2.number = idx
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            
            Spacer()
            
            Toggle("VM2 Toggle", isOn: $vm2.isClick)
        } // HStack
    }
}

#Preview {
    ObservationBasic()
        .environmentObject(UserObservableObject())
        .environment(UserObservableMacro())
}
