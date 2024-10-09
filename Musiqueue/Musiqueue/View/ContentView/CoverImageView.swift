//
//  CoverImageView.swift
//  Musiqueue
//
//  Created by johyukjun on 10/8/24.
//

import SwiftUI

struct CoverImageView: View {
    // property
    @ObservedObject var artistVM: ArtistViewModel
    
    var body: some View {
        TabView {
            ForEach(artistVM.coverImages) { cover in
                Image(cover.name)
                    .resizable()
                    .scaledToFill()
            } // ForEach
            .tabViewStyle(.automatic)
        } // TabView
    }
}

#Preview {
    CoverImageView(artistVM: ArtistViewModel())
}
