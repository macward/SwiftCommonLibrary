//
//  File.swift
//  
//
//  Created by Max Ward on 07/11/2023.
//

import Foundation

public extension Bundle {
    func decode<T: Decodable>(_ file: String, of type: T.Type) -> T  {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError()
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError()
        }
        
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError()
        }
        
        return loaded
    }
}
