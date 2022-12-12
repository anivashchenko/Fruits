//
//  Copyright © 2022 Anastasiia Ivashchenko. All rights reserved.
//

import SwiftUI

struct FoodAdd: View {
    
    @EnvironmentObject var modelData: ModelData
    
    @State var food: Food
    @State var typeFood: Food.TypeFood = .fruits
    @State var countValue: Int = 0
    @State var showAddedScreen: Bool = false
    
    var modelDataType: [Food] {
        get {
            if food.typeFood == .fruits {
                return modelData.fruits
            } else if food.typeFood == .vegies {
                return modelData.vegies
            } else {
                return modelData.berries
            }
        }
    }
    
    var foodIndex: Int {
        modelDataType.firstIndex { $0.id == food.id }!
    }
    
    var body: some View {
        ZStack {
                VStack {
                    Text(food.name)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color("DarkGreen"))
                        .frame(width: UIScreen.main.bounds.width * 0.9)
                        .padding(.vertical, 8)
                        .background(.thinMaterial)
                        .cornerRadius(10)
                    
                    Image(food.name)
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width * 0.9,
                            height: UIScreen.main.bounds.height * 0.5)
                        .clipped()
                    
                    Spacer()
                    
                    if food.typeFood == .fruits {
                        AddButton(isSet: $modelData.fruits[foodIndex].isAddedToList,
                                  showAddedScreen: $showAddedScreen,
                                  food: modelData.fruits[foodIndex])
                    }
                    if food.typeFood == .vegies {
                        AddButton(isSet: $modelData.vegies[foodIndex].isAddedToList,
                                  showAddedScreen: $showAddedScreen,
                                  food: modelData.vegies[foodIndex])
                    }
                    if food.typeFood == .berries {
                        AddButton(isSet: $modelData.berries[foodIndex].isAddedToList,
                                  showAddedScreen: $showAddedScreen,
                                  food: modelData.berries[foodIndex])
                    }
                }
                
                VStack {
                    showAddedScreen ? InformationScreen() : nil
                } // END VSTACK
        } // END ZSTACK
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("DarkGreen").opacity(0.5))
        
    }
}

struct FoodAdd_Previews: PreviewProvider {
    static var previews: some View {
        FoodAdd(food: ModelData().fruits[1])
            .environmentObject(ModelData())
    }
}
