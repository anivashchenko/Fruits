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
            let url = URL(string: fruit.imageURL)

            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let returnedImage):
                    returnedImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                case .failure:
                    Image(systemName: "questionmark.square.dashed")
                        .font(.headline)
                default:
                    Image(systemName: "questionmark.square.dashed")
                        .font(.headline)
                }
            }
                
            VStack {
                Text(fruit.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(fruit.mainland)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
    }
}

struct FruitRow_Previews: PreviewProvider {
    static var fruits = ModelData().fruits
    
    static var previews: some View {
        FruitRow(fruit: fruits[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
    
}
