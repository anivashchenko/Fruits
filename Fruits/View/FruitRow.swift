//
//  FruitRow.swift
//  Fruits
//
//  Created by Анастасія on 06.12.2022.
//

import SwiftUI

struct FruitRow: View {
    
    var fruit: Fruit
    
    var body: some View {
        HStack {
            Image(fruit.name)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding(10)
                
            VStack(alignment: .leading) {
                Text(fruit.name)
                    .font(.title)
                    .foregroundColor(.primary)
                Text(fruit.mainland)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
    }
}

struct FruitRow_Previews: PreviewProvider {
    static var previews: some View {
        FruitRow(fruit: ModelData().fruits[1])
            .previewLayout(.fixed(width: 300, height: 50))
            .environmentObject(ModelData())
    }
    
}
