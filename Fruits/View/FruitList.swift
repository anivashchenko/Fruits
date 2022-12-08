//
//  FruitList.swift
//  Fruits
//
//  Created by Анастасія on 06.12.2022.
//

import SwiftUI

struct FruitList: View {

    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(modelData.fruits, id: \.self) { fruit in
                    NavigationLink {
                        FruitDetail(fruit: fruit)
                    } label: {
                        FruitRow(fruit: fruit)
                            .frame(height: 50)
                    }
                    .listStyle(.insetGrouped)
                }
            }
            .navigationTitle("Fruits")
        }
    }
}

struct FruitList_Previews: PreviewProvider {
    static var previews: some View {
        FruitList()
            .environmentObject(ModelData())
    }
}
