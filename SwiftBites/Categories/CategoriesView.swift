import SwiftUI
import SwiftData

enum CategoryNavigationDestination: Hashable {
    case CategoryForm(CategoryForm.Mode)
    case RecipeForm(RecipeForm.Mode)
}

struct CategoriesView: View {
    @Environment(\.modelContext) private var context
    @Query var categories: [CategoryModel]
      
    @State private var query = ""

  // MARK: - Body

    private var filteredCategories: [CategoryModel] {
        let predicate = #Predicate<CategoryModel> {
            $0.name.localizedStandardContains(query)
        }
        
        let descriptor = FetchDescriptor<CategoryModel>(
            predicate: query.isEmpty ? nil : predicate
        )
        
        do {
            let filteredCategories = try context.fetch(descriptor)
            return filteredCategories
        } catch {
            return []
        }
    }

    var body: some View {
        NavigationStack {
            content
                .navigationTitle("Categories")
                .toolbar {
                    if !categories.isEmpty {
                        NavigationLink(value: CategoryForm.Mode.add) {
                            Label("Add", systemImage: "plus")
                        }
                    }
                }
                .navigationDestination(for: CategoryForm.Mode.self) { mode in
                    CategoryForm(mode: mode)
                }
                .navigationDestination(for: RecipeForm.Mode.self) { mode in
                    RecipeForm(mode: mode)
                }
          }
    }

  // MARK: - Views

    @ViewBuilder
    private var content: some View {
        if categories.isEmpty {
            empty
        } else {
            list(for: filteredCategories)
        }
    }

    private var empty: some View {
        ContentUnavailableView(
            label: {
                Label("No Categories", systemImage: "list.clipboard")
            },
            description: {
                Text("Categories you add will appear here.")
            },
            actions: {
                NavigationLink("Add Category", value: CategoryForm.Mode.add)
                    .buttonBorderShape(.roundedRectangle)
                    .buttonStyle(.borderedProminent)
            }
        )
    }

    private var noResults: some View {
        ContentUnavailableView(
            label: {
              Text("Couldn't find \"\(query)\"")
            }
        )
    }

    private func list(for categories: [CategoryModel]) -> some View {
        ScrollView(.vertical) {
            if categories.isEmpty {
                noResults
            } else {
                LazyVStack(spacing: 10) {
                    ForEach(categories, content: CategorySection.init)
                }
            }
        }
        .searchable(text: $query)
      }
  }
