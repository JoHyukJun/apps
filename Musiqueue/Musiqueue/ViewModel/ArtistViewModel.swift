//
//  ArtistViewModel.swift
//  Musiqueue
//
//  Created by johyukjun on 10/7/24.
//

import Foundation
import SwiftUI


class ArtistViewModel: ObservableObject {
    // property
    @Published var artists: [Artist] = Bundle.main.decode("artists.json")
    @Published var coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    @Published var videos: [Video] = Bundle.main.decode("videos.json")
    
    // GalleryView
    @Published var selectedArtist: String = "acdc"
    
    // GridLayout
    @Published var gridLayout: [GridItem] = [GridItem(.flexible())]
    @Published var gridColumn: Double = 4.0
   
    // init
    init() {
        gridSwitch()
    }
    
    // func
    func gridSwitch() {
        gridLayout = Array(repeating: GridItem(.flexible()), count: Int(gridColumn))
    }
}
