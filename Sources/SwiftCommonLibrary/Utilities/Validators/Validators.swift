//
//  Validators.swift
//  
//
//  Created by Max Ward on 26/10/2023.
//

import Foundation

public struct EmailValidator: Validatable {
    private let emailPattern = #"^\S+@\S+\.\S+$"#
    public init() {}
    public func validate(_ str: String) -> Result<Bool, ValidationError> {
        if str.isEmpty {
            return .failure(.Message("Username is empty"))
        }
        
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailPattern)
        if  !predicate.evaluate(with: str) {
            return .failure(.Message("Invalid email address."))
        }
        
        return .success(true)
    }
}

public struct UsernameValidator: Validatable {
    private let usernamePattern = "^" +
                                  "[a-zA-Z]" +
                                  "[a-zA-Z0-9]" +
                                  "{2,9}" +
                                  "$"
    public init() {}
    public func validate(_ str: String) -> Result<Bool, ValidationError> {
        
        if str.isEmpty {
            return .failure(.Message("Username is empty"))
        }
        
        if str.count < 3 {
            return .failure(.Message("Username must be at least 3 characters long."))
        }
        
        let predicate = NSPredicate(format:"SELF MATCHES %@", usernamePattern)
        if  !predicate.evaluate(with: str) {
            return .failure(.Message("Please, check your username."))
        }
        return .success(true)
    }
}

public struct PasswordValidator: Validatable {
    public init() {}
    public func validate(_ str: String) -> Result<Bool, ValidationError> {
        
        // password is empty
        if str.count < 6 {
            return .failure(.Message("Password must be at least 6 characters long."))
        }
        // password lowercase
        if !str.contains(where: { $0.isLowercase }) {
            return .failure(.Message("Password must include at least 1 lowercase letter."))
        }
        // check uppercase
        if !str.contains(where: { $0.isUppercase }) {
            return .failure(.Message("Password must include at least 1 uppercase letter."))
        }
        if !str.contains(where: { "!@#$%^&*()_-+=[{]};:'\",<.>/?".contains($0) }) {
            return .failure(.Message("Password must include at least 1 special character."))
        }
        
        return .success(true)
    }
}
