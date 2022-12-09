//
//  FoodCategory.swift
//  Fruits
//
//  Created by Анастасія on 08.12.2022.
//

import SwiftUI

struct FoodCategory: View {
    
    //@EnvironmentObject var modelData: ModelData
    @StateObject var modelData = ModelData()
    
    let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 100, maximum: 120), spacing: nil, alignment: .center),
        GridItem(.adaptive(minimum: 100, maximum: 120), spacing: nil, alignment: .center),
        GridItem(.adaptive(minimum: 100, maximum: 120), spacing: nil, alignment: .center)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                LazyVGrid(
                    columns: columns,
                    alignment: .center,
                    spacing: 6,
                    pinnedViews: [.sectionHeaders],
                    content: {
                        
                        Section(
                            header:
                                Text("FRUIT")
                                    .foregroundColor(Color("MyYellow"))
//                                  .foregroundColor(Color("DarkGreen"))
                                    .font(.largeTitle)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 8)
                                    .background(Color("MyYellow").opacity(0.15))
                                    .bold(),
                            content: {
                                ForEach(modelData.fruits, id: \.self) { fruit in
                                    NavigationLink {
                                        FoodAdd(food: fruit)
//                                            .background(.yellow)
                                    } label: {
                                        FoodGrid(food: fruit)
                                            .border(.yellow)
                                            .tint(.yellow)
                                    }
                                }
                            }
                        ) // END SECTION FRUIT
                        
                        Section(
                            header:
                                Text("VEGETABLES")
                                    .foregroundColor(Color("DarkGreen"))
                                    .font(.largeTitle)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 8)
                                    .background(Color("DarkGreen").opacity(0.2))
                                    .bold(),
                            content: {
                                ForEach(modelData.vegies, id: \.self) { vegetable in
                                    NavigationLink {
                                        FoodAdd(food: vegetable)
                                    } label: {
                                        FoodGrid(food: vegetable)
                                    }
                                }
                            }
                        ) // END SECTION VEGY
                        
                        Section(
                            header:
                                Text("BERRY")
                                    .foregroundColor(Color("DarkGreen"))
                                    .font(.largeTitle)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 8)
                                    .background(Color("DarkGreen").opacity(0.2))
                                    .bold(),
                            content: {
                                ForEach(modelData.berries, id: \.self) { berry in
                                    NavigationLink {
                                        FoodAdd(food: berry)
                                    } label: {
                                        FoodGrid(food: berry)
                                    }
                                }
                            }
                        ) // END SECTION BERRY
                        
                    } // END CONTENT
                ) // END GRID
            } // END NAV
            .navigationTitle("My shop list")
        } // END
    }
}

struct FoodCategory_Previews: PreviewProvider {
    static var previews: some View {
        FoodCategory()
            .environmentObject(ModelData())
    }
}
