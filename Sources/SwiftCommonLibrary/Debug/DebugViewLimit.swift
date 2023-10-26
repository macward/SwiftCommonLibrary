//
//  DebugViewLimit.swift
//
//
//  Created by Max Ward on 26/10/2023.
//

import SwiftUI

struct DebugViewLimit: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .border(color)
    }
}

extension View {
    func debugViewLimit(_ color: Color = .green) -> some View {
        modifier(DebugViewLimit(color: color))
    }
}
