//
//  Copyright © 2022 Anastasiia Ivashchenko. All rights reserved.
//

import SwiftUI

struct BasketList: View {
    
    @EnvironmentObject var modelData: ModelData
    
    @State var countBoughtItem: Int = 0
    @State var food: Food = ModelData().fruits[1]
    @State var isListOneOn: Bool = false
    @State var showActionSheet: Bool = false
    @State var showAddList: Bool = false
    @State var typeFood: Food.TypeFood = .fruits
    
    var orderedFruits: [Food] { modelData.fruits.filter { fruit in fruit.isAddedToList }}
    var orderedVegies: [Food] { modelData.vegies.filter { vegetable in vegetable.isAddedToList }}
    var orderedBerries: [Food] { modelData.berries.filter { berry in berry.isAddedToList }}

    var boughtFruit: [Food] { modelData.fruits.filter { fruit in fruit.isBought }}
    var boughtVegies: [Food] { modelData.vegies.filter { vegetable in vegetable.isBought }}
    var boughtBerries: [Food] { modelData.berries.filter { berry in berry.isBought }}
    
    @State var boughtFood: [[Food]] = []
    @State var compactBoughtFood: [Food] = []
    @State var compactOrderedFood: [Food] = []
    @State var newList: [Food] = []
    @State var orderedFood: [[Food]] = []
    @State var showAlert: Bool = false
        
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    if isListOneOn {
                        Section {
                            ForEach(newList, id: \.self) { food in
                                BasketRow(food: food, countBoughtItem: $countBoughtItem)
                            }
                            .onMove(perform: move)
                            .listRowBackground(Color("DarkGreen").opacity(0.35))
                        } // END SECTION
                    }
                        
                    if !isEmptyBasket() && !isListOneOn {
                        Section(header:
                                    Text("Want to buy:")
                            .font(.headline)
                            .foregroundColor(Color("DarkGreen"))
                        ) {
                            ForEach(compactOrderedFood, id: \.self) { food in
                                BasketRow(food: food, countBoughtItem: $countBoughtItem)
                            }
                            .onMove(perform: move)
                            .listRowBackground(Color("DarkGreen").opacity(0.35))
                        } // END SECTION
                    } // END IF
                    
                    if countBoughtItem > 0 && !isListOneOn {
                        Section(header:
                                    Text("Bought:")
                                        .font(.headline)
                                        .foregroundColor(Color("MyYellow"))
                        ) {
                            ForEach(compactBoughtFood, id: \.self) { food in
                                BasketRow(food: food, countBoughtItem: $countBoughtItem)
                            }
                            .onMove(perform: move)
                            .listRowBackground(Color("MyYellow"))
                        } // END SECTION
                    } // END IF
                } // END LIST
                .onAppear(perform: getList)
                .listStyle(.insetGrouped)
                .navigationTitle("My basket")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    ToolbarItem() {
                        deleteButton
                    }
                    ToolbarItem() {
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
            InformationScreen(delay: 2, topic: .list)
        }
    }
        
    func move(indices: IndexSet, newOffset: Int) {
        newList.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func getList() {
        orderedFood = [orderedFruits, orderedVegies, orderedBerries]
        compactOrderedFood = orderedFood.flatMap { $0 }
        boughtFood = [boughtFruit, boughtVegies, boughtBerries]
        compactBoughtFood = boughtFood.flatMap { $0 }
        
        newList.append(contentsOf: compactOrderedFood)
        newList.append(contentsOf: compactBoughtFood)

        var unique: [Food] = []
        for food in newList {
            if unique.contains(food) {
                let id = unique.firstIndex { $0 == food }
                unique.remove(at: id ?? 0)
            }
            unique.append(food)
        }
        newList = unique
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
        getList()
        
        for food in newList {
            if food.typeFood == .fruits {
                let foodIndex = modelData.fruits.firstIndex { $0.id == food.id }!
                modelData.fruits[foodIndex].isAddedToList = false
                modelData.fruits[foodIndex].isBought = false
                modelData.fruits[foodIndex].countValue = 0
            } else if food.typeFood == .vegies {
                let foodIndex = modelData.vegies.firstIndex { $0.id == food.id }!
                modelData.vegies[foodIndex].isAddedToList = false
                modelData.vegies[foodIndex].isBought = false
                modelData.vegies[foodIndex].countValue = 0
            } else {
                let foodIndex = modelData.berries.firstIndex { $0.id == food.id }!
                modelData.berries[foodIndex].isAddedToList = false
                modelData.berries[foodIndex].isBought = false
                modelData.berries[foodIndex].countValue = 0
            }
        }
        modelData.countItem = 0
        countBoughtItem = 0
        orderedFood = []
        boughtFood = []
        newList = []
    } // END FUNC
}

struct BasketList_Previews: PreviewProvider {
    static var previews: some View {
        BasketList()
            .environmentObject(ModelData())
    }
}
