//
//  ShopListApp.swift
//  ShopList
//
//  Created by Анастасія on 06.12.2022.
//

import SwiftUI

@main
struct ShopListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ModelData())
        }
    }
}

