//
//  AppInfoView.swift
//  Menuote
//
//  Created by johyukjun on 11/24/24.
//

import SwiftUI

struct AppInfoView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    GroupBox {
                        // content
                        AppInfoContentView(name: "Developer", content: "Unlucky Strike")
                        AppInfoContentView(name: "Compatibility", content: "macOS 15.0")
                        AppInfoContentView(name: "Version", content: "1.0.0")
                        AppInfoContentView(name: "Website", linkLabel: "Unlucky Strike", linkDestination: "unluckystrike.com")
                        AppInfoContentView(name: "Github", linkLabel: "Go to Repository", linkDestination: "github.com/JoHyukJun/apps")
                    } label: {
                        AppInfoLabelView(labelText: "Application", labelImage: "apps.iphone")
                    }
                    
                    GroupBox {
                        // content
                        Divider()
                            .padding(.vertical, 5)
                        
                        HStack(spacing: 10) {
                            Text("""
                                         MIT License
                                         
                                         Copyright (c) 2024 Unlucky Strike
                                        
                                         Permission is hereby granted, free of charge, to any person obtaining a copy
                                         of this software and associated documentation files (the "Software"), to deal
                                         in the Software without restriction, including without limitation the rights
                                         to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
                                         copies of the Software, and to permit persons to whom the Software is
                                         furnished to do so, subject to the following conditions:
                                        
                                         The above copyright notice and this permission notice shall be included in all
                                         copies or substantial portions of the Software.
                                        
                                         THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
                                         IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
                                         FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
                                         AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
                                         LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
                                         OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
                                         SOFTWARE.
                                        """)
                            .font(.footnote)
                            .hTrailing()
                        } // HStack
                        
                        Divider().padding(.vertical, 5)
                    } label: {
                        AppInfoLabelView(labelText: "License", labelImage: "lock.shield.fill")
                    }
                    
                } // VStack
            } // ScrollView
            .navigationTitle("App Info")
            .frame(minWidth: 270)
        }
    }
}
