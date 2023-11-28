//
//  OnLoad.swift
//
//
//  Created by Max Ward on 28/11/2023.
//

import Foundation
import SwiftUI

struct OnLoadAsyncViewModifier: ViewModifier {
    let action: () -> Void
    @State private var loaded: Bool = false
    func body(content: Content) -> some View {
        content.task {
            if !loaded {
                loaded = true
                action()
            }
        }
    }
}

struct OnLoadViewModifier: ViewModifier {
    let action: () -> Void
    @State private var loaded: Bool = false
    func body(content: Content) -> some View {
        content
            .onAppear() {
                if !loaded {
                    loaded = true
                    action()
                }
            }
    }
}

extension View {
    public func onLoad(perform action: @escaping () -> Void) -> some View {
        modifier(OnLoadViewModifier(action: action))
    }
    
    public func onLoadAsync(perform action: @escaping () -> Void) -> some View{
        modifier(OnLoadAsyncViewModifier(action: action))
    }
}
