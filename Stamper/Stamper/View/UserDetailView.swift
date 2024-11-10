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
    
    @ObservedObject var vm: StampViewModel
    
    var body: some View {
        List {
            Text(isIOS ? "iPhone" : "macOS")
            
            Section("General") {
                LabeledContent {
                    Text(vm.stamp.name)
                } label: {
                    Text("Name")
                }

                LabeledContent {
                    Text(vm.stamp.company)
                } label: {
                    Text("Company")
                }
                
                LabeledContent {
                    Text("\(vm.stamp.totalFreeCoffee)")
                } label: {
                    Text("Total Free Coffee")
                }
            }
            
            Section("Stamp \(vm.stamp.selectedCoffee)/7") {
                if isIOS {
                    VStack (spacing: 20) {
                        HStack {
                            ForEach(1..<4, id: \.self) { idx in
                                Image(systemName: "cup.and.saucer")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .onTapGesture {
                                        // SELECTED COFFEE ACTION
                                        vm.stamp.selectedCoffee = idx
                                        
                                        self.save()
                                    }
                                    .foregroundStyle(idx <= vm.stamp.selectedCoffee ? Color.accentColor : .gray.opacity(0.3))
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
                                        vm.stamp.selectedCoffee = idx
                                        
                                        self.save()
                                    }
                                    .foregroundStyle(idx <= vm.stamp.selectedCoffee ? Color.accentColor : .gray.opacity(0.3))
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
                                vm.stamp.totalFreeCoffee += 1
                                
                                vm.stamp.selectedCoffee = 0
                                
                                self.save()
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
                                        vm.stamp.selectedCoffee = idx
                                        
                                        self.save()
                                    }
                                    .foregroundStyle(idx <= vm.stamp.selectedCoffee ? Color.accentColor : .gray.opacity(0.3))
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
                                vm.stamp.totalFreeCoffee += 1
                                
                                vm.stamp.selectedCoffee = 0
                                
                                self.save()
                            }
                    } // VStack
                }
            } // Section
            
            Section("Notes") {
                Text(vm.stamp.notes)
            }
        } // List
        .scrollContentBackground(.hidden)
        .background(Color.accentColor.opacity(0.2))
        .navigationTitle("User Detail")
    }
    
    func save() {
        do {
            try vm.viewModelSave()
        } catch {
            print("Error saving: \(error)")
        }
    }
}
