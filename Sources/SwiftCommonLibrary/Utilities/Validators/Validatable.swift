//
//  Validatable.swift
//
//
//  Created by Max Ward on 26/10/2023.
//

import Foundation

public enum ValidationError: Error {
    case Message(String)
}

public protocol Validatable {
    func validate(_ str: String) -> Result<Bool, ValidationError>
}
