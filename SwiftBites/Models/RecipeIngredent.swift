//
//  RecipeIngredent.swift
//  SwiftBites
//
//  Created by William Epic on 06/11/2024.
//

import Foundation
import SwiftData

@Model
final class RecipeIngredient: Identifiable, Hashable {
    let id: UUID
    
    @Relationship(deleteRule: .nullify)
    var ingredient: Ingredient

    var quantity: String
    
    @Relationship(deleteRule: .cascade, inverse: \Recipe.ingredients)
    var recipe: Recipe?

    init(id: UUID = UUID(), ingredient: Ingredient = Ingredient(), quantity: String = "") {
        self.id = id
        self.ingredient = ingredient
        self.quantity = quantity
    }
    
    static func == (lhs: RecipeIngredient, rhs: RecipeIngredient) -> Bool {
        lhs.id == rhs.id
    }
}
