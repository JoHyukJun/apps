//
//  ShareLinkBasic.swift
//  Basic
//
//  Created by johyukjun on 10/14/24.
//

import SwiftUI

struct ShareLinkBasic: View {
    // property
    let legoImage = ImageFile(image: Image("lego"))
    
    var body: some View {
        VStack(spacing: 20) {
            // URL ShareLink
            ShareLink(item: URL(string: "https://unluckystrike.com")!) {
                Text("Link share")
                    .font(.largeTitle)
            }
            
            // Image ShareLink
            ShareLink(item: legoImage, preview: SharePreview("Lego Image", image: legoImage.image)) {
                Text("Image share")
                    .font(.largeTitle)
            }
        } // VStack
        .padding()
    }
}

#Preview {
    ShareLinkBasic()
}


struct ImageFile: Transferable {
    var image: Image
    
    static var transferRepresentation: some TransferRepresentation {
        ProxyRepresentation(exporting: \.image)
    }
}
