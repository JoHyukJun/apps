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
    // Vertical Center
    func vCenter() -> some View {
        self.frame(maxHeight: .infinity, alignment: .center)
    }
    
    // Vertical Top
    func vTop() -> some View {
        self.frame(maxHeight: .infinity, alignment: .top)
    }
    
    // Vertical Bottom
    func vBottom() -> some View {
        self.frame(maxHeight: .infinity, alignment: .bottom)
    }
    
    // Horizontal Center
    func hCenter() -> some View {
        self.frame(maxWidth: .infinity, alignment: .center)
    }
    
    // Horizontal Leading
    func hLeading() -> some View {
        self.frame(maxWidth: .infinity, alignment: .leading)
    }
    
    // Horizontal Trailing
    func hTrailing() -> some View {
        self.frame(maxWidth: .infinity, alignment: .trailing)
    }
}
