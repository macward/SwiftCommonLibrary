//
//  ActivityIndicator.swift
//
//
//  Created by Max Ward on 27/10/2023.
//

import SwiftUI

public struct ActivityIndicatorContainerViewModifier<InnerView: View>: ViewModifier {
    
    private var isLoading: Bool
    @ViewBuilder private var innerView: InnerView
    
    public init(isLoading: Bool, view: @escaping () -> InnerView) {
        self.isLoading = isLoading
        self.innerView = view()
    }
    
    public func body(content: Content) -> some View {
        content.overlay {
            innerView.opacity(isLoading ? 1 : 0)
        }
    }
}

public struct LoadingView: View {
    
    public init() {}
    
    public var body: some View {
        ZStack(alignment: .center) {
            Color(.systemBackground)
                .ignoresSafeArea()
                .opacity(0.8)
            ProgressView()
                .progressViewStyle(.circular)
                .tint(.gray)
        }
    }
}

extension View {
    
    public func activityIndicator(isLoading: Bool, content: @escaping () -> some View) -> some View {
        return modifier(ActivityIndicatorContainerViewModifier(isLoading: isLoading, view: content))
    }
    
    public func activityIndicatorDefault(isLoading: Bool) -> some View {
        return modifier(ActivityIndicatorContainerViewModifier(isLoading: isLoading, view: {
            LoadingView()
        }))
    }
}
