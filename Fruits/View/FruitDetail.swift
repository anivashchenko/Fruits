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
            GeometryReader { geometry in
                VStack {
                    Image("BananaT")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width)
                        .clipped()
                        .ignoresSafeArea()
                }
            }
                        
            VStack {
                Spacer()
                Spacer()
                
                Text(fruit.name)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 6)
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
               
                Text(fruit.description)
                    .font(.callout)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(20)
                    .multilineTextAlignment(.center)
                    .background(.primary.opacity(0.8))
                    .cornerRadius(10)
                    .padding(20)
                    .textSelection(.enabled)
                
                Spacer()
                
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
