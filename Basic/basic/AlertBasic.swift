//
//  AlertBasic.swift
//  Basic
//
//  Created by johyukjun on 9/8/24.
//

import SwiftUI

struct AlertBasic: View {
    // property
    @State var showAlert1: Bool = false
    @State var showAlert2: Bool = false
    @State var showAlert3: Bool = false
    @State var showAlert4: Bool = false
    
    @State var bgColor: Color = Color.yellow
    @State var alertTitle: String = ""
    @State var alertMsg: String = ""
    @State var alertType: AlertCase? = nil
    
    enum AlertCase {
        case success
        case error
    }
    
    var body: some View {
        ZStack {
            bgColor.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Button {
                    showAlert1.toggle()
                } label: {
                    Text("#1 alert")
                }
                .alert(isPresented: $showAlert1) {
                    Alert(title: Text("invalid password"))
                }

                Button {
                    showAlert2.toggle()
                } label: {
                    Text("#2 alert")
                }
                .alert(isPresented: $showAlert2) {
                    getAlert2()
                }
                
                HStack(spacing: 10) {
                    Button {
                        alertTitle = "upload error"
                        alertMsg = "invalid video type"
                        showAlert3.toggle()
                    } label: {
                        Text("#3 alert fail")
                    }
                    
                    Button {
                        alertTitle = "upload success"
                        alertMsg = "video uploaded"
                        showAlert3.toggle()
                    } label: {
                        Text("#3 alert pass")
                    }
                } // HStack
                .alert(isPresented: $showAlert3) {
                    getAlert3()
                }
                
                HStack(spacing: 10) {
                    Button {
                        alertType = .error
                        showAlert4.toggle()
                    } label: {
                        Text("#4 alert fail")
                    }
                    
                    Button {
                        alertType = .success
                        showAlert4.toggle()
                    } label: {
                        Text("#4 alert pass")
                    }
                } // HStack
                .alert(isPresented: $showAlert4) {
                    getAlert4()
                }
            } // VStack
        } // ZStack
    } // Body
    
    func getAlert2() -> Alert {
        return Alert(
            title: Text("delete message"),
            message: Text("do u want to delete message?"),
            primaryButton: .destructive(Text("delete"), action: {
                bgColor = .red
            }),
            secondaryButton: .cancel()
        )
    }
    
    func getAlert3() -> Alert {
        return Alert(
            title: Text(alertTitle),
            message: Text(alertMsg),
            dismissButton: .default(Text("ok"))
        )
    }
    
    func getAlert4() -> Alert {
        switch alertType {
        case .success:
            return Alert(title: Text("pass"), dismissButton: .default(Text("ok"), action: {
                bgColor = .green
            }))
        case .error:
            return Alert(title: Text("error occur, check again"), dismissButton: .default(Text("ok"), action: {
                bgColor = .red
            }))
        default:
            return Alert(title: Text("error"))
        }
    }
}

#Preview {
    AlertBasic()
}
