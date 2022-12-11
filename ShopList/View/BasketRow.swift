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
    @State var isBought: Bool = false
    
    var body: some View {
        HStack {
            if isBought {
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
            isBought.toggle()
        }
    }
    
    func remove(type: Food.TypeFood, id: Int) {
        if type == .fruits {
            let foodIndex = modelData.fruits.firstIndex { $0.id == id }!
            modelData.fruits[foodIndex].isAddedToList = false
            modelData.fruits[foodIndex].countValue = 0
        } else if type == .vegies {
            let foodIndex = modelData.vegies.firstIndex { $0.id == id }!
            modelData.vegies[foodIndex].isAddedToList = false
            modelData.fruits[foodIndex].countValue = 0
        } else {
            let foodIndex = modelData.berries.firstIndex { $0.id == id }!
            modelData.berries[foodIndex].isAddedToList = false
            modelData.fruits[foodIndex].countValue = 0
        }
        
        modelData.countItem -= 1
    }
    
}

struct BasketRow_Previews: PreviewProvider {
    static var previews: some View {
        BasketRow(food: ModelData().fruits[1])
    }
}
