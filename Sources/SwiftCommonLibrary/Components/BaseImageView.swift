//
//  BackgroundImageView.swift
//  
//
//  Created by Max Ward on 26/10/2023.
//

import SwiftUI

public struct BaseImageView<Content: View>: View {
    
    var image: String
    @ViewBuilder var content: Content
    
    public var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            content
        }
    }
}

#Preview {
    BaseImageView(image: "BG") {
        Text("Sample")
    }
}
