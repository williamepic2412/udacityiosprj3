//
//  Ingredent.swift
//  SwiftBites
//
//  Created by William Epic on 06/11/2024.
//

import Foundation
import SwiftData

@Model
final class Ingredient: Identifiable, Hashable {
    let id: UUID
    var name: String

    init(id: UUID = UUID(), name: String = "") {
        self.id = id
        self.name = name
    }
    
    static func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
        lhs.id == rhs.id
    }
}
