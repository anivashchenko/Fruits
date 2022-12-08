//
//  ContentView.swift
//  Fruits
//
//  Created by Анастасія on 06.12.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        FruitList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
