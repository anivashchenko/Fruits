//
//  FoodAdd.swift
//  Fruits
//
//  Created by Анастасія on 08.12.2022.
//

import SwiftUI

struct FoodAdd: View {
    
    @EnvironmentObject var modelData: ModelData
    
    @State var food: Food
    @State var typeFood: Food.TypeFood = .fruits
    @State var countValue: Int = 0
    @State var showAddedScreen: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
        
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
            GeometryReader { geomentry in
                VStack {
                    Text(food.name)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color("DarkGreen"))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .background(.thinMaterial)
                        .cornerRadius(10)
                        .offset(y: 20)
                    
                    Image(food.name)
                        .resizable()
                        .scaledToFit()
                        .clipped()
                        .offset(y: 20)
                }
                .frame(width: geomentry.size.width * 0.8)
                .offset(x: geomentry.size.width * 0.1)
                
                VStack {
                    if showAddedScreen {
                        AddToTheList()
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    presentationMode.wrappedValue.dismiss()
                                }
                            }
                    } else {
                        Spacer()
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
                        
                        Spacer()

                    }
                } // END VSTACK
            } // END GEOM
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
