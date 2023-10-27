//
//  File.swift
//  
//
//  Created by Max Ward on 27/10/2023.
//

import Foundation

public extension Optional {
    func isEmpty() -> Bool {
        switch self {
        case .some(_): return false
        case .none: return true
        }
    }
}
