//
//  SwiftUIView.swift
//  
//
//  Created by Max Ward on 26/10/2023.
//

import SwiftUI

public struct BaseView<Content: View>: View {
    
    var color: Color
    var content: Content
    
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

#Preview {
    BaseView(color: .red) {
        Text("View")
    }
}
