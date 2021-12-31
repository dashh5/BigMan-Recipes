//
//  ModifyRecipeView.swift
//  Cookcademy
//
//  Created by Alex M on 12/9/21.
//

import SwiftUI

struct ModifyRecipeView: View {
    @Binding var recipe: Recipe
    @State private var selection = Selection.main
    enum Selection {
        case main
        case ingredients
        case directions
      }
    
    var body: some View {
        VStack {
            Picker("Select recipe component.", selection: $selection) {
                Text("Main Info").tag(Selection.main)
                Text("Ingredients").tag(Selection.ingredients)
                Text("Directions").tag(Selection.directions)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            switch selection {
            case .main:
                ModifyMainInformationView(mainInformation: $recipe.mainInformation)
            case .ingredients:
                Text("Ingredients editor")
            case .directions:
                Text("Directions editor")
            }
            Spacer()
        }
        
        
        
    }
}

struct ModifyRecipeView_Previews: PreviewProvider {
    @State static var recipe = Recipe()
    static var previews: some View {
        ModifyRecipeView(recipe: $recipe)
    }
}
