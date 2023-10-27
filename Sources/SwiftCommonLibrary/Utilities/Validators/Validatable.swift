//
//  Validatable.swift
//
//
//  Created by Max Ward on 26/10/2023.
//

import Foundation

public protocol Validatable {
    var errorMessage: String { get set}
    func validate(_ str: String) -> Bool
}
