//
//  Copyright © 2022 Anastasiia Ivashchenko. All rights reserved.
//

import SwiftUI

struct BasketRow: View {
    
    @EnvironmentObject var modelData: ModelData
    
    @State var food: Food
    @Binding var countBoughtItem: Int

    var body: some View {
        HStack {
            if food.isBought || !food.isAddedToList {
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
                            food.isAddedToList = false
                            food.isBought = false
                            food.countValue = 0
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
            food.isBought.toggle()
            food.isAddedToList ? (countBoughtItem += 1) : (countBoughtItem -= 1)
            food.isAddedToList.toggle()
            listAndBoughtToggle(type: food.typeFood, id: food.id)
        }
    }
    
    func remove(type: Food.TypeFood, id: Int) {
        listAndBoughtToggle(type: type, id: id)
        
        if type == .fruits {
            let foodIndex = modelData.fruits.firstIndex { $0.id == id }!
            modelData.fruits[foodIndex].countValue = 0
        } else if type == .vegies {
            let foodIndex = modelData.vegies.firstIndex { $0.id == id }!
            modelData.vegies[foodIndex].countValue = 0
        } else {
            let foodIndex = modelData.berries.firstIndex { $0.id == id }!
            modelData.berries[foodIndex].countValue = 0
        }
        
        modelData.countItem -= 1
    }
    
    func listAndBoughtToggle(type: Food.TypeFood, id: Int) {
        if type == .fruits {
            let foodIndex = modelData.fruits.firstIndex { $0.id == id }!
            modelData.fruits[foodIndex].isAddedToList = false
            modelData.fruits[foodIndex].isBought = false
        } else if type == .vegies {
            let foodIndex = modelData.vegies.firstIndex { $0.id == id }!
            modelData.vegies[foodIndex].isAddedToList = false
            modelData.vegies[foodIndex].isBought = false
        } else {
            let foodIndex = modelData.berries.firstIndex { $0.id == id }!
            modelData.berries[foodIndex].isAddedToList = false
            modelData.berries[foodIndex].isBought = false
        }
    }
    
}

struct BasketRow_Previews: PreviewProvider {
    static var previews: some View {
        BasketRow(food: ModelData().fruits[1], countBoughtItem: .constant(0))
    }
}
