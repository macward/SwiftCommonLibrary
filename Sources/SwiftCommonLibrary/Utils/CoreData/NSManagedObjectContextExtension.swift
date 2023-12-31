//
//  File.swift
//  
//
//  Created by Max Ward on 23/11/2023.
//

import Foundation
import CoreData

public extension NSManagedObjectContext {

    /// Only performs a save if there are changes to commit.
    /// - Returns: `true` if a save was needed. Otherwise, `false`.
    @discardableResult func saveIfNeeded() throws -> Bool {
        guard hasChanges else { return false }
        try save()
        return true
    }
}

