//
//  EncodableExtensions.swift
//
//
//  Created by Max Ward on 07/11/2023.
//

import Foundation

public extension Encodable {
    // Return a dictionary
    func toDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            throw NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to convert data to dictionary"])
        }
        return dictionary
    }
    
    // convert the current object in another codable object
    func adapt<T: Codable>(to: T.Type) throws -> T {
        let data = try JSONEncoder().encode(self)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
