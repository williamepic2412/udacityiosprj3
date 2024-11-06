//
//  Recipe.swift
//  SwiftBites
//
//  Created by William Epic on 06/11/2024.
//

import Foundation
import SwiftData

@Model
final class Recipe: Identifiable, Hashable {
    let id: UUID
    @Attribute(.unique) var name: String
    var summary: String
    var category: CategoryModel?
    var serving: Int
    var time: Int
    var ingredients: [RecipeIngredient] = []
    var instructions: String
    var imageData: Data?

    init(id: UUID = UUID(),
         name: String = "",
         summary: String = "",
         category: CategoryModel? = nil,
         serving: Int = 1,
         time: Int = 5,
         ingredients: [RecipeIngredient] = [],
         instructions: String = "",
         imageData: Data? = nil) {
        self.id = id
        self.name = name
        self.summary = summary
        self.category = category
        self.serving = serving
        self.time = time
        self.ingredients = ingredients
        self.instructions = instructions
        self.imageData = imageData
    }
    
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        lhs.id == rhs.id
    }
}
