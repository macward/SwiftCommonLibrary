//
//  File.swift
//  
//
//  Created by Max Ward on 27/10/2023.
//

import Foundation

public extension String {
    mutating func clear() {
        self = ""
    }
    
    static var empty: String {
        return ""
    }
}
