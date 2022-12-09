////
////  FruitDetail.swift
////  Fruits
////
////  Created by Анастасія on 07.12.2022.
////
//
//import SwiftUI
//
//struct FruitDetail: View {
//        
//    var food: Food
//    
//    var body: some View {
//        ZStack {
//            GeometryReader { geometry in
//                VStack {
//                    Image("BananaT")
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: geometry.size.width, height: geometry.size.height * 0.66)
//                        .cornerRadius(10)
//                        .clipped()
//                        .ignoresSafeArea()
//                        .overlay(alignment: .bottom) {
//                            Text(food.name)
//                                .font(.largeTitle)
//                                .bold()
//                                .foregroundColor(.primary)
//                                .frame(maxWidth: .infinity)
//                                .padding(.vertical, 8)
//                                .background(.ultraThinMaterial)
//                                .cornerRadius(10)
//                                .offset(y: -20)
//                                .padding(.horizontal, 20)
//                        }
//                        
//                }
//            }
//                        
//            VStack {
//                Spacer()
//                Spacer()
//
////                Text(fruit.name)
////                    .font(.largeTitle)
////                    .bold()
////                    .foregroundColor(.primary)
////                    .frame(maxWidth: .infinity)
////                    .padding(.vertical, 6)
////                    .background(.ultraThinMaterial)
////                    .cornerRadius(10)
////                    .padding(.horizontal, 20)
//               
//                Divider()
//                    .foregroundColor(Color("DarkGreen"))
//                    .font(.title)
//                
//                Text("Desription")
//                    .foregroundColor(.secondary)
//                    //.multilineTextAlignment(.leading)
//                    .padding(6)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    //.background(.green)
//                    
//            
//                Text(food.description)
//                    .font(.callout)
//                    .foregroundColor(Color("DarkGreen"))
//                    .padding(.horizontal)
//                    .padding(10)
//                    .multilineTextAlignment(.center)
//                    //.cornerRadius(10)
//                    //.padding(20)
//                    .textSelection(.enabled)
//            }
//        }
//    }
//}
//
//struct FruitDetail_Previews: PreviewProvider {
//    static var fruits = ModelData().fruits
//    
//    static var previews: some View {
//        FruitDetail(food: fruits[0])
//    }
//}
