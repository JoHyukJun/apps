//
//  ActionSheetBasic.swift
//  Basic
//
//  Created by johyukjun on 9/21/24.
//
//  Can't use in mac os
//

import SwiftUI

struct ActionSheetBasic: View {
    // property
    @State var showActionSheet: Bool = false
    @State var resultActionSheet: String = ""
    
    var body: some View {
        VStack {
            Text(resultActionSheet)
                .font(.largeTitle)
            
            Spacer()
            
            // content
            HStack {
                Circle()
                    .frame(width: 30, height: 30)
                
                Text("UNLUCKY STRIKE")
                
                Spacer()
                
                Button {
                    // action
                    showActionSheet.toggle()
                } label: {
                    Image(systemName: "ellipsis")
                }

            } // HStack
            .padding(.horizontal)
            
            Rectangle()
                .aspectRatio(1.0, contentMode: .fit)
            
            Spacer()
        } // VStack
//        .actionSheet(isPresented: $showActionSheet) {
//            // actionSheet type
//            getActionSheet()
//        }
    }
    
    // function
//    func getActionSheet() -> ActionSheet {
//        let shareButton: ActionSheet.Button = .default(Text("share")) {
//            // action
//            resultActionSheet = "shared done"
//        }
//        
//        let reportButton: ActionSheet.Button = .default(Text("report")) {
//            // action
//            resultActionSheet = "reported done"
//        }
//        
//        let deleteButton: ActionSheet.Button = .default(Text("delete")) {
//            // action
//            resultActionSheet = "delete done"
//        }
//        
//        let cancleButton: ActionSheet.Button = .cancel()
//        
//        return ActionSheet(title: Text("action sheet title"), message: Text("action sheet message"), buttons: [shareButton, reportButton, deleteButton, cancleButton])
//    }
}

#Preview {
    ActionSheetBasic()
}
