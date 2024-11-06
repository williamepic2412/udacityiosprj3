//
//  Category.swift
//  SwiftBites
//
//  Created by William Epic on 06/11/2024.
//

import Foundation
import SwiftData

@Model
final class CategoryModel: Identifiable, Hashable {
    let id: UUID
    @Attribute(.unique) var name: String
    
    @Relationship(deleteRule: .nullify, inverse: \Recipe.category)
    var recipes: [Recipe] = []

    init(id: UUID = UUID(), name: String = "", recipes: [Recipe] = []) {
        self.id = id
        self.name = name
    }

    static func == (lhs: CategoryModel, rhs: CategoryModel) -> Bool {
        lhs.id == rhs.id
    }
}
