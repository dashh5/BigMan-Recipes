//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Alex M on 12/8/21.
//

import Foundation

class RecipeData: ObservableObject {
    // The VM property "recipies" is being observed. Whenever it changes, it updates this view. Class needs to conform to Observable object in order for views to observe its properties. 
    @Published var recipes = Recipe.testRecipes
    
    func recipes(for category: MainInformation.Category) -> [Recipe] {
        var filteredRecipes = [Recipe]()
        for recipe in recipes {
            if recipe.mainInformation.category == category {
                filteredRecipes.append(recipe)
            }
        }
        return filteredRecipes
    }
    
    func add(recipe: Recipe) {
        if recipe.isValid {
            recipes.append(recipe)
        }
    }
}
