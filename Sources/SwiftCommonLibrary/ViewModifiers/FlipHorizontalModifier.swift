//
//  SwiftUIView.swift
//  
//
//  Created by Max Ward on 07/11/2023.
//

import SwiftUI

public struct FlipHorizontalModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content.rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0)) // flip image
    }
}

public extension View {
    func flipHorizontal() -> some View {
        modifier(FlipHorizontalModifier())
    }
}
