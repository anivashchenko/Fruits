//
//  ContentView.swift
//  Fruits
//
//  Created by Анастасія on 06.12.2022.
//

import SwiftUI

struct ContentView: View {
    private var fruits = ModelData().fruits
    
    var body: some View {
        FruitRow(fruit: fruits[0])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
