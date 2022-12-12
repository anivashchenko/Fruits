//
//  BasketRow.swift
//  ShopList
//
//  Created by Анастасія on 10.12.2022.
//

import SwiftUI

struct BasketRow: View {
    
    @EnvironmentObject var modelData: ModelData
    
    @State var food: Food
    @Binding var countBoughtItem: Int

    var body: some View {
        HStack {
            if food.isBought {
                Image(systemName: "checkmark.square.fill")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 45)
            } else {
                Image(food.name)
                    .resizable()
                    .frame(width: 45, height: 35)
            }
            Text(food.name)
            Text("x\(food.countValue)")
                .foregroundColor(Color(uiColor: .darkGray))
            Spacer()
            Image(systemName: "star.fill")
                .foregroundColor(food.isFavorite ? .yellow : nil)
                .onTapGesture() {
                    food.isFavorite.toggle()
                }
                .swipeActions(
                    edge: .trailing) {
                        Button {
//                            food.isAddedToList = false
//                            food.countValue = 0
                            remove(type: food.typeFood, id: food.id)
                        } label: {
                            Image(systemName: "trash.fill")
                                .foregroundColor(.white)
                                .padding(10)
                        }
                        .tint(.red)
                    }
                .swipeActions(
                    edge: .leading) {
                        Button {
                            food.isFavorite.toggle()
                        } label: {
                            Image(systemName: "star.fill")
                                .foregroundColor(.white)
                                .padding(10)
                        }
                        .tint(.yellow)
                    }
        }
        .onTapGesture(count: 2) {
            food.isAddedToList ? (countBoughtItem += 1) : (countBoughtItem -= 1)
            
            if food.typeFood == .fruits {
                let foodIndex = modelData.fruits.firstIndex { $0.id == food.id }!
                modelData.fruits[foodIndex].isAddedToList.toggle()
                modelData.fruits[foodIndex].isBought.toggle()
            } else if food.typeFood == .vegies {
                let foodIndex = modelData.vegies.firstIndex { $0.id == food.id }!
                modelData.vegies[foodIndex].isAddedToList.toggle()
                modelData.fruits[foodIndex].isBought.toggle()
            } else {
                let foodIndex = modelData.berries.firstIndex { $0.id == food.id }!
                modelData.berries[foodIndex].isAddedToList.toggle()
                modelData.fruits[foodIndex].isBought.toggle()
            }
        }
    }
    
    func remove(type: Food.TypeFood, id: Int) {
        if type == .fruits {
            let foodIndex = modelData.fruits.firstIndex { $0.id == id }!
            modelData.fruits[foodIndex].isAddedToList = false
            modelData.fruits[foodIndex].isBought = false
            modelData.fruits[foodIndex].countValue = 0
        } else if type == .vegies {
            let foodIndex = modelData.vegies.firstIndex { $0.id == id }!
            modelData.vegies[foodIndex].isAddedToList = false
            modelData.fruits[foodIndex].isBought = false
            modelData.fruits[foodIndex].countValue = 0
        } else {
            let foodIndex = modelData.berries.firstIndex { $0.id == id }!
            modelData.berries[foodIndex].isAddedToList = false
            modelData.fruits[foodIndex].isBought = false
            modelData.fruits[foodIndex].countValue = 0
        }
        
        modelData.countItem -= 1
    }
    
}

struct BasketRow_Previews: PreviewProvider {
    static var previews: some View {
        BasketRow(food: ModelData().fruits[1], countBoughtItem: .constant(0))
    }
}
