import SwiftUI
import SwiftData

@main
struct SwiftBitesApp: App {
    let container: ModelContainer
    
    init () {
        do {
            container = try ModelContainer(for: Ingredient.self,
                                                CategoryModel.self,
                                                Recipe.self,
                                                RecipeIngredient.self)
        } catch {
            fatalError("Model Container setup failed.")
        }
    }
    
    var body: some Scene {
      WindowGroup {
        ContentView()
              .modelContainer(container)
      }
    }
}
