//
//  BoolExtensions.swift
//
//
//  Created by Max Ward on 27/10/2023.
//

import Foundation

public extension Bool {
    
    mutating func turnOn() {
        self = true
    }
    
    mutating func turnOff() {
        self = false
    }
}
