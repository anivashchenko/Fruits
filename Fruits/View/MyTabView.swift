//
//  MyTabView.swift
//  Fruits
//
//  Created by Анастасія on 08.12.2022.
//

import SwiftUI

struct MyTabView: View {
    
    @State var selectedTab: Tab = .category
    
    enum Tab {
        case category
        case basket
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            FoodCategory()
                .tabItem {
                    Label("Category", systemImage: "square.grid.3x3.fill")
                }
                .tag(Tab.category)
            
            FoodBasket()
                .tabItem {
                    Label("Basket", systemImage: "basket.fill")
                }
                .tag(Tab.basket)
        }
        
    }
}

struct MyTabView_Preview: PreviewProvider {
    static var previews: some View {
        MyTabView()
            .environmentObject(ModelData())
    }
}
