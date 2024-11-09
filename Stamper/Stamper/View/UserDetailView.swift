//
//  UserDetailView.swift
//  Stamper
//
//  Created by johyukjun on 11/9/24.
//

import SwiftUI

struct UserDetailView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var isIOS: Bool {
        horizontalSizeClass == .compact
    }
    
    var body: some View {
        List {
            Text(isIOS ? "iPhone" : "macOS")
            
            Section("General") {
                LabeledContent {
                    Text("Test Name")
                } label: {
                    Text("Name")
                }

                LabeledContent {
                    Text("Test Company")
                } label: {
                    Text("Company")
                }
                
                LabeledContent {
                    Text("10")
                } label: {
                    Text("Total Free Coffee")
                }
            }
            
            Section("Stamp \(1)/7") {
                if isIOS {
                    VStack (spacing: 20) {
                        HStack {
                            ForEach(1..<4, id: \.self) { idx in
                                Image(systemName: "cup.and.saucer")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .onTapGesture {
                                        // SELECTED COFFEE ACTION
                                    }
                                    .foregroundStyle(Color.accentColor)
                            }
                            .padding(.horizontal, 10)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                        HStack {
                            ForEach(4..<8, id: \.self) { idx in
                                Image(systemName: "cup.and.saucer")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .onTapGesture {
                                        // SELECTED COFFEE ACTION
                                    }
                                    .foregroundStyle(Color.accentColor)
                            }
                            .padding(.horizontal, 10)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                        Image(systemName: "cup.and.saucer.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundStyle(Color.accentColor)
                            .onTapGesture {
                                // COUNT TOTAL FREE COFFEE ACTION
                            }
                    }
                }
                else {
                    VStack(spacing: 10) {
                        HStack {
                            ForEach(1..<8, id: \.self) { idx in
                                Image(systemName: "cup.and.saucer")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .onTapGesture {
                                        // SELECTED COFFEE ACTION
                                    }
                                    .foregroundStyle(Color.accentColor)
                            }
                            .padding(.horizontal, 10)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                        Image(systemName: "cup.and.saucer.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundStyle(Color.accentColor)
                            .onTapGesture {
                                // COUNT TOTAL FREE COFFEE ACTION
                            }
                    } // VStack
                }
            } // Section
            
            Section("Notes") {
                Text("Test Notes")
            }
        } // List
        .scrollContentBackground(.hidden)
        .background(Color.accentColor.opacity(0.2))
        .navigationTitle("Test Name")
    }
}

#Preview {
    UserDetailView()
}
