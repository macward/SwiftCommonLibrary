//
//  SwiftUIView.swift
//  
//
//  Created by Max Ward on 26/10/2023.
//

import SwiftUI

public struct BaseImageView<Content: View>: View {
    
    var image: String
    @ViewBuilder var content: Content
    
    public init(image: String, content: @escaping () -> Content) {
        self.image = image
        self.content = content()
    }
    
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

public struct BaseView<Content: View>: View {
    
    var color: Color
    @ViewBuilder var content: Content
    
    public init(color: Color, content: @escaping () -> Content) {
        self.color = color
        self.content = content()
    }
    
    public var body: some View {
        ZStack {
            color.ignoresSafeArea()
            content
        }
    }
}

public struct GradientContainerView<Content: View>: View {
    
    var background: RadialGradient
    @ViewBuilder var content: Content
    
    public init(background: RadialGradient, content: @escaping () -> Content) {
        self.background = background
        self.content = content()
    }
    
    public var body: some View {
        ZStack {
            background.ignoresSafeArea()
            content
        }
    }
}

#Preview {
    BaseView(color: .red) {
        Text("View")
    }
}
