//
//  FoodBasket.swift
//  Fruits
//
//  Created by Анастасія on 08.12.2022.
//

import SwiftUI

struct BasketList: View {
    
    @EnvironmentObject var modelData: ModelData
    
    @State var food: Food = ModelData().fruits[1]
    @State var typeFood: Food.TypeFood = .fruits

    var orderedFruits: [Food] { modelData.fruits.filter { fruit in fruit.isAddedToList }}
    var orderedVegies: [Food] { modelData.vegies.filter { vegetable in vegetable.isAddedToList }}
    var orderedBerries: [Food] { modelData.berries.filter { berry in berry.isAddedToList }}

    @State var orderedFood: [[Food]] = []
    @State var boughtFood: [Food] = []
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
                    if !isEmptyBasket() {
                        Section(header:
                                    Text("Want to buy:")
                            .font(.headline)
                            .foregroundColor(Color("DarkGreen"))
                        ) {
                            ForEach(orderedFood, id: \.self) { typeFood in
                                ForEach(typeFood) { food in
                                    BasketRow(food: food)
                                }
                                .listRowBackground(Color("DarkGreen").opacity(0.35))
                            } // END FOREACH
                        } // END SECTION
                    } // END IF
                    
                    if boughtFood.count > 0 {
                        Section(header:
                                    Text("Bought:")
                            .font(.headline)
                            .foregroundColor(Color("MyYellow"))
                        ) {
                            ForEach(boughtFood, id: \.self) { food in
                                BasketRow(food: food)
                            }
                            .listRowBackground(Color("MyYellow").opacity(0.15))
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
        } // END TOOLBAR
        } // END NAV
        .background(
            Color("DarkGreen")
                .opacity(0.5)
        )
       
        BasketEmpty()
            .offset(y: isEmptyBasket() ? 0 : UIScreen.main.bounds.height)

        } // END ZSTACK
    } // END BODY
    
    var deleteButton: some View {
        Button {
            showAlert.toggle()
        } label: {
            Image(systemName: "trash.square.fill")
                .font(.title)
                .foregroundColor(Color("DarkGreen"))
        }
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func getList() {
        orderedFood = [orderedFruits, orderedVegies, orderedBerries]
    }
    
    func isEmptyBasket() -> Bool {
        orderedFruits.count == 0 && orderedVegies.count == 0 && orderedBerries.count == 0
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
            } else if food.typeFood == .vegies {
                let foodIndex = modelData.vegies.firstIndex { $0.id == food.id }!
                modelData.vegies[foodIndex].isAddedToList = false
            } else {
                let foodIndex = modelData.berries.firstIndex { $0.id == food.id }!
                modelData.berries[foodIndex].isAddedToList = false
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
