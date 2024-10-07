//
//  FrameExtention.swift
//  Musiqueue
//
//  Created by johyukjun on 10/7/24.
//

import SwiftUI
import Foundation


// Frame Modifier

extension View {
    // vertical center
    func vCenter() -> some View {
        self.frame(maxHeight: .infinity, alignment: .center)
    }
    
    // vertical top
    func vTop() -> some View {
        self.frame(maxHeight: .infinity, alignment: .top)
    }
    
    // vertical bottom
    func vBottom() -> some View {
        self.frame(maxHeight: .infinity, alignment: .bottom)
    }
    
    // horizontal center
    func hCenter() -> some View {
        self.frame(maxWidth: .infinity, alignment: .center)
    }
    
    // horizontal top
    func hTop() -> some View {
        self.frame(maxWidth: .infinity, alignment: .top)
    }
    
    // horizontal bottom
    func hBottom() -> some View {
        self.frame(maxWidth: .infinity, alignment: .bottom)
    }
}
