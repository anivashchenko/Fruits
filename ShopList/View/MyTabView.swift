//
//  Copyright © 2022 Anastasiia Ivashchenko. All rights reserved.
//

import SwiftUI

struct MyTabView: View {
    
    @EnvironmentObject var modelData: ModelData    
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
            
            BasketList(food: modelData.fruits[1])
                .tabItem {
                    Label("Basket", systemImage: "basket.fill")
                }
                .tag(Tab.basket)
                .badge(modelData.countItem)
        }
    }
}

struct MyTabView_Preview: PreviewProvider {
    static var previews: some View {
        MyTabView()
            .environmentObject(ModelData())
    }
}
