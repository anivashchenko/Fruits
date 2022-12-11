//
//  AddButton.swift
//  ShopList
//
//  Created by Анастасія on 09.12.2022.
//

import SwiftUI

struct AddButton: View {
    
    @EnvironmentObject var modelData: ModelData
    
    @Binding var isSet: Bool
    @Binding var showAddedScreen: Bool

    @State var countValue: Int = 0
    @State var food: Food
    @State var typeFood: Food.TypeFood = .fruits
    
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
        HStack {
            FoodStepper(countValue: $countValue,
                        food: modelDataType[foodIndex])
                .padding(10)
            
            Spacer()

            Text("\(Food.countItem)")
            
            Button {
                if countIsSet() {
                    if isSet == false {
                        Food.countItem += 1
                    }
                    isSet = true
                    showAddedScreen = true
                }
            } label: {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 80, height: 60)
                    .padding(20)
                    .overlay {
                        Image(systemName: "basket.fill")
                            .font(.title)
                            .foregroundColor(.white)
                    }
            }
            .disabled(!countIsSet())

        } // END HSTACK
    } // END BODY
        
    func countIsSet() -> Bool {
        countValue > 0
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton(isSet: .constant(false), showAddedScreen: .constant(false),
                  food: ModelData().fruits[1])
            .environmentObject(ModelData())
    }
}
