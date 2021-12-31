//
//  RecipesListView.swift
//  Cookcademy
//
//  Created by Alex M on 12/7/21.
//

import SwiftUI

struct RecipesListView: View {
    // declared environment object, passed in through dot syntax from parent view call.
    @EnvironmentObject var recipeData: RecipeData
    @State private var isPresenting: Bool = false
    @State private var newRecipe = Recipe()
    
    let category: MainInformation.Category
    
    let listBackgroundColor = AppColor.background
    let listTextColor = AppColor.foreground
    
      var body: some View {
              List {
                ForEach(recipes) { recipe in
                    NavigationLink(recipe.mainInformation.name, destination: RecipeDetailView(recipe: recipe))
                }
                .foregroundColor(listTextColor)
                .listRowBackground(listBackgroundColor)
              }
              .navigationTitle(navigationTitle)
              .toolbar(content: { ToolbarItem(placement: .navigationBarTrailing, content: {
                  Button(action: {isPresenting = true} , label: { Image(systemName: "plus")})
              }) })
              
              .sheet(isPresented: $isPresenting, content: {
                  NavigationView {
                      ModifyRecipeView(recipe: $newRecipe)
                          .navigationTitle("Add a new recipe")
                          .toolbar(content: {
                              ToolbarItem(placement: .cancellationAction, content: {
                                  Button("Dismiss", action: {isPresenting = false})
                              })
                              
                              ToolbarItem(placement: .navigationBarTrailing, content: {
                                  if newRecipe.isValid {
                                      Button("Add", action: {
                                          recipeData.add(recipe: newRecipe)
                                          isPresenting = false
                                      })
                                  }
                              })
                          })
                  }
              })
          }
          
          
        
      }


extension RecipesListView {
  var recipes: [Recipe] {
      recipeData.recipes(for: category)
  }
 
  var navigationTitle: String {
      "\(category.rawValue) Recipes"
  }
}
 

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipesListView(category: .breakfast)
                    .environmentObject(RecipeData())
        }
        
    }
}
