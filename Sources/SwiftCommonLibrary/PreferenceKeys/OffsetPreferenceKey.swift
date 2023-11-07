//
//  OffsetPreferenceKey.swift
//
//
//  Created by Max Ward on 07/11/2023.
//

import SwiftUI

struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        return value = nextValue()
    }
}

extension View {
    @ViewBuilder
    public func offsetY(completion: @escaping (CGRect) -> ()) -> some View {
        self.overlay {
            GeometryReader {
                let rect = $0.frame(in: .global)
                Color.clear
                    .preference(key: OffsetPreferenceKey.self, value: rect)
                    .onPreferenceChange(OffsetPreferenceKey.self, perform: completion)
            }
        }
    }
}
