//
//  FoodStepper.swift
//  Fruits
//
//  Created by Анастасія on 08.12.2022.
//

import SwiftUI

struct FoodStepper: View {
    
    @EnvironmentObject var modelData: ModelData
    
    @Binding var countValue: Int

    @State var countValueFloat: CGFloat = 0
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
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("MyOrange"))
                .frame(width: (140 + countValueFloat/10), height: 50)
            
            HStack(spacing: 10) {
                Button {
                    if countIsPositive() {
                        incrementWidth(amount: -1)
                    }
                } label: {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color("MyOrange"))
                        .frame(width: 50, height: 50)
                        .overlay {
                            Image(systemName: "minus")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                }
                .disabled(!countIsPositive())
                
                Text("\(modelData.fruits[foodIndex].countValue)")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                
                Button {
                    incrementWidth(amount: 1)
                } label: {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color("MyOrange"))
                        .frame(width: 50, height: 50)
                        .overlay {
                            Image(systemName: "plus")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                }
            } // END HSTACK
        } // END ZSTACK
        .frame(width: 170, height: 80)
        .onAppear() {
            countValue = modelData.fruits[foodIndex].countValue
        }
    }
    
    func incrementWidth(amount: Int) {
        withAnimation(.easeInOut) {
            countValue = amount + modelData.fruits[foodIndex].countValue
            countValueFloat = CGFloat(integerLiteral: amount)
                        
            if food.typeFood == .fruits {
                modelData.fruits[foodIndex].countValue = countValue
            } else if food.typeFood == .vegies {
                modelData.vegies[foodIndex].countValue = countValue
            } else {
                modelData.berries[foodIndex].countValue = countValue
            }
        }
    }
    
    func countIsPositive() -> Bool {
        modelData.fruits[foodIndex].countValue > 0 ? true : false
    }
}

struct FoodStepper_Previews: PreviewProvider {
    static var previews: some View {
        FoodStepper(countValue: .constant(0), food: ModelData().fruits[1])
            .environmentObject(ModelData())
    }
}
