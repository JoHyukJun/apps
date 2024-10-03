//
//  TextFieldBasic.swift
//  Basic
//
//  Created by johyukjun on 10/3/24.
//

import SwiftUI

struct TextFieldBasic: View {
    // property
    @State var inputText: String = ""
    @State var userNameData: [String] = []
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("input at least two words", text: $inputText)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                    .font(.headline)
                
                TextEditor(text: $inputText)
                    .frame(height: 250)
                    .colorMultiply(Color.gray.opacity(0.3))
                
                Button {
                    if isValidInputValue() {
                        saveText()
                    }
                } label: {
                    Text("save")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isValidInputValue() ? Color.blue : Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .disabled(!isValidInputValue())

                
                Spacer()
                
                ForEach(userNameData, id: \.self) { item in
                    Text(item)
                }
            } // VStack
            .padding()
            .navigationTitle("YOUR NAME")
        } // nagivation
    } // body
    
    func isValidInputValue() -> Bool {
        if (inputText.count > 1) {
            return true
        }
        else {
            return false
        }
    }
    
    func saveText() {
        userNameData.append(inputText)
        inputText = ""
    }
}

#Preview {
    TextFieldBasic()
}
