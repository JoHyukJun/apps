//
//  ArtistViewModel.swift
//  Musiqueue
//
//  Created by johyukjun on 10/7/24.
//

import Foundation


class ArtistViewModel: ObservableObject {
    // property
    @Published var artists: [Artist] = Bundle.main.decode("artists.json")
}
