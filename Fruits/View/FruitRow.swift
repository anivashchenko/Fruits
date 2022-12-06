//
//  FruitRow.swift
//  Fruits
//
//  Created by Анастасія on 06.12.2022.
//

import SwiftUI

struct FruitRow: View {
    
    let fruit: Fruit
    
    var body: some View {
        HStack {
            Image(systemName: "apple.logo")
            
            VStack {
                Text("Title")
                Text("Description")
            }
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
