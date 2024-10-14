//
//  GridRowBasic.swift
//  Basic
//
//  Created by johyukjun on 10/14/24.
//

import SwiftUI

struct GridRowBasic: View {
    var body: some View {
        VStack(spacing: 20) {
            Grid {
                GridRow {
                    Color.red
                    Color.blue
                    Color.green
                } // GridRow
                
                GridRow {
                    Color.red
                        .frame(width: 100, height: 100)
                    Color.red
                        .frame(width: 30, height: 30)
                        .gridCellColumns(1)
                        .gridCellAnchor(.leading)
                } // GridRow
            } // Grid
            .frame(height: 200)
            
            Divider()
            
            Grid {
                GridRow {
                    Color.blue
                        .frame(width: 30, height: 30)
                    Color.blue
                        .frame(width: 30, height: 30)
                    Color.blue
                        .frame(width: 30, height: 30)
                } // GridRow
                
                GridRow {
                    Color.blue
                        .frame(width: 30, height: 30)
                }
            }
            .frame(height: 200)
        } // VStack
    }
}

#Preview {
    GridRowBasic()
}
