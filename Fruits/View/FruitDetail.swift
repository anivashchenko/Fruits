//
//  FruitDetail.swift
//  Fruits
//
//  Created by Анастасія on 07.12.2022.
//

import SwiftUI

struct FruitDetail: View {
    
    var fruit: Fruit
    
    var body: some View {
        ZStack {
            Image("Banana")
                .resizable()
                .frame(maxWidth: .infinity)
                .brightness(0.5)
            
            VStack(alignment: .leading) {
                Text(fruit.name)
                    .font(.title)
                    .foregroundColor(.primary)
                    .background(.ultraThinMaterial)
                
                Spacer()
                
                Divider()
                Text(fruit.description)
                    .font(.footnote)
                    .frame(width: .infinity)
                    .multilineTextAlignment(.center)
                    .background(.ultraThinMaterial)
            }
        }
    }
}

struct FruitDetail_Previews: PreviewProvider {
    static var fruits = ModelData().fruits
    
    static var previews: some View {
        FruitDetail(fruit: fruits[0])
    }
}
