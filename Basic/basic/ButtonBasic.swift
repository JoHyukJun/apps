//
//  ButtonBasic.swift
//  Basic
//
//  Created by johyukjun on 8/24/24.
//

import SwiftUI

struct ButtonBasic: View {
    // property
    @State var mainTitle: String = "non click"
    
    var body: some View {
        VStack(spacing: 20) {
            // reset button
            Button {
                self.mainTitle = "reset button click"
            } label: {
                Text("reset button")
            }

            
            // label
            Text(mainTitle)
                .font(.title)
            
            Divider()
            
            Button {
                // action
                self.mainTitle = "default button click"
            } label: {
                // label
                Text("default button")
            }
            .accentColor(.red)

            Divider()
            
            Button {
                self.mainTitle = "save button click"
            } label: {
                Text("save")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(
                        Color.blue
                            .cornerRadius(10)
                            .shadow(radius: 10)
                    )
            }

            Divider()
            
            Button {
                self.mainTitle = "icon button click"
            } label: {
                Circle()
                    .fill(Color.white)
                    .frame(width: 75, height: 75)
                    .shadow(radius: 10)
                    .overlay(
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundColor(Color.red)
                    )
            }

            // capsule button
            Button {
                self.mainTitle = "complete button click"
            } label: {
                Text("complete")
                    .font(.caption)
                    .bold()
                    .foregroundColor(.gray)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(
                        Capsule()
                            .stroke(Color.gray, lineWidth: 2.5)
                    )
            }

        }
    }
}

#Preview {
    ButtonBasic()
}
