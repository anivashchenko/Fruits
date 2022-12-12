//
//  Copyright © 2022 Anastasiia Ivashchenko. All rights reserved.
//

import SwiftUI

struct BasketList: View {
    
    @EnvironmentObject var modelData: ModelData
    
    @State var food: Food = ModelData().fruits[1]
    @State var typeFood: Food.TypeFood = .fruits
    @State var countBoughtItem: Int = 0
    @State var showActionSheet: Bool = false
    @State var isListOneOn: Bool = false
    @State var showAddList: Bool = false
    
    var orderedFruits: [Food] { modelData.fruits.filter { fruit in fruit.isAddedToList }}
    var orderedVegies: [Food] { modelData.vegies.filter { vegetable in vegetable.isAddedToList }}
    var orderedBerries: [Food] { modelData.berries.filter { berry in berry.isAddedToList }}

    var boughtFruit: [Food] { modelData.fruits.filter { fruit in fruit.isBought }}
    var boughtVegies: [Food] { modelData.vegies.filter { vegetable in vegetable.isBought }}
    var boughtBerries: [Food] { modelData.berries.filter { berry in berry.isBought }}
    
    @State var orderedFood: [[Food]] = []
    @State var boughtFood: [[Food]] = []
    @State var showAlert: Bool = false
    
    var modelDataType: [Food] {
        get {
            if food.typeFood == .fruits {
                return modelData.fruits
            } else if food.typeFood == .vegies {
                return modelData.vegies
            } else {
                return modelData.berries
            }
        }
    }
        
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    if isListOneOn {
                        Section {
                            ForEach(orderedFood, id: \.self) { typeFood in
                                ForEach(typeFood) { food in
                                    BasketRow(food: food, countBoughtItem: $countBoughtItem)
                                }
                                .listRowBackground(Color("DarkGreen").opacity(0.35))
                            } // END FOREACH
                        } // END SECTION
                    }
                        
                    if !isEmptyBasket() && !isListOneOn {
                        Section(header:
                                    Text("Want to buy:")
                            .font(.headline)
                            .foregroundColor(Color("DarkGreen"))
                        ) {
                            ForEach(orderedFood, id: \.self) { typeFood in
                                ForEach(typeFood) { food in
                                    BasketRow(food: food, countBoughtItem: $countBoughtItem)
                                }
                                .listRowBackground(Color("DarkGreen").opacity(0.35))
                            } // END FOREACH
                        } // END SECTION
                    } // END IF
                    
                    if countBoughtItem > 0 && !isListOneOn {
                        Section(header:
                                    Text("Bought:")
                            .font(.headline)
                            .foregroundColor(Color("MyYellow"))
                        ) {
                            ForEach(boughtFood, id: \.self) { typeFood in
                                ForEach(typeFood) { food in
                                    BasketRow(food: food, countBoughtItem: $countBoughtItem)
                                }
                                .listRowBackground(Color("MyYellow"))
                                } // END FOREACH
                        } // END SECTION
                    } // END IF
            } // END LIST
            .onAppear(perform: getList)
            .listStyle(.insetGrouped)
            .navigationTitle("My basket")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    deleteButton
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    settingsButton
                }
            } // END TOOLBAR
        } // END NAV
        .background(
            Color("DarkGreen")
                .opacity(0.5)
        )
       
        BasketEmpty()
            .offset(y: (isEmptyBasket() && countBoughtItem == 0) ? 0 : UIScreen.main.bounds.height)

    } // END ZSTACK
} // END BODY
    
    var deleteButton: some View {
        Button {
            showAlert.toggle()
        } label: {
            Image(systemName: "trash.circle")
                .font(.title2)
                .foregroundColor(Color("DarkGreen"))
        }
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    var settingsButton: some View {
        Button {
            showActionSheet.toggle()
        } label: {
            Image(systemName: "ellipsis.circle")
                .font(.title2)
                .foregroundColor(Color("DarkGreen"))
        }
        .actionSheet(isPresented: $showActionSheet) {
            getActionSheet()
        }
        .sheet(isPresented: $showAddList) {
            AddToTheList(delay: 2, topic: .list)
        }
    }
    
    func getList() {
        orderedFood = [orderedFruits, orderedVegies, orderedBerries]
        boughtFood = [boughtFruit, boughtVegies, boughtBerries]
    }
    
    func isEmptyBasket() -> Bool {
        orderedFruits.isEmpty && orderedVegies.isEmpty && orderedBerries.isEmpty
    }
    
    func getActionSheet() -> ActionSheet {
        return ActionSheet(
            title: Text("Which type of list would you like to see?"),
            buttons: [
                .default(Text(isListOneOn ? "\u{27A9} List" : "List")) {
                    isListOneOn ? (showAddList = true) : (isListOneOn = true)
                },
                .default(Text(!isListOneOn ? "\u{27A9} Want to buy & Bought" : "Want to buy & Bought")) {
                    !isListOneOn ? (showAddList = true) : (isListOneOn = false)
                },
                .cancel()
            ])
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text("Do you want to remove the whole list?"),
             primaryButton: .destructive(Text("Delete"),
                    action: { removeAll() }),
             secondaryButton: Alert.Button.cancel())
    }
    
    func removeAll() {
        let compactOrderedFood = orderedFood.flatMap { $0 }
        for food in compactOrderedFood {
            if food.typeFood == .fruits {
                let foodIndex = modelData.fruits.firstIndex { $0.id == food.id }!
                modelData.fruits[foodIndex].isAddedToList = false
                modelData.fruits[foodIndex].countValue = 0
            } else if food.typeFood == .vegies {
                let foodIndex = modelData.vegies.firstIndex { $0.id == food.id }!
                modelData.vegies[foodIndex].isAddedToList = false
                modelData.fruits[foodIndex].countValue = 0
            } else {
                let foodIndex = modelData.berries.firstIndex { $0.id == food.id }!
                modelData.berries[foodIndex].isAddedToList = false
                modelData.fruits[foodIndex].countValue = 0
            }
        }
        modelData.countItem = 0
    } // END FUNC
}

struct BasketList_Previews: PreviewProvider {
    static var previews: some View {
        BasketList()
            .environmentObject(ModelData())
    }
}
