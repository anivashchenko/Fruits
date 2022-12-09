////
////  FruitRow.swift
////  Fruits
////
////  Created by Анастасія on 06.12.2022.
////
//
//import SwiftUI
//
//struct FruitRow: View {
//    
//    var food: Food
//    
//    var body: some View {
//        HStack {
//            Image(food.name)
//                .resizable()
//                .scaledToFit()
//                .frame(width: 50, height: 50)
//                .padding(10)
//
//            VStack(alignment: .leading) {
//                Text(food.name)
//                    .font(.title)
//                    .foregroundColor(.primary)
//                Text(food.mainland)
//                    .font(.subheadline)
//                    .foregroundColor(.secondary)
//            }
//
//            Spacer()
//        }
//    }
//}
//
//struct FruitRow_Previews: PreviewProvider {
//    static var previews: some View {
//        FruitRow(food: ModelData().fruits[1])
//            //.previewLayout(.fixed(width: 300, height: 300))
//            .environmentObject(ModelData())
//    }
//    
//}
