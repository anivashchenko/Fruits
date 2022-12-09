//
//  FoodGrid.swift
//  Fruits
//
//  Created by Анастасія on 08.12.2022.
//

import SwiftUI

struct FoodGrid: View {

    var food: Food
    
    var body: some View {
        ZStack {
            Image(food.name)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(10)
                .overlay(alignment: .bottomTrailing) {
                    Image(systemName: "plus.circle.fill")
                        .font(.largeTitle)
                        .symbolRenderingMode(.hierarchical)
                        .padding(10)
                        .offset(x: 10, y: 10)
                }
        }
        .frame(width: 120, height: 120)
        .border(Color("DarkGreen"))
    }
}
    

struct FruitGrid_Previews: PreviewProvider {
    static var previews: some View {
        FoodGrid(food: ModelData().fruits[1])
            .previewLayout(.fixed(width: 200, height: 200))
            .environmentObject(ModelData())
    }
}
