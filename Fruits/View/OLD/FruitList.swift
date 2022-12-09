////
////  FruitList.swift
////  Fruits
////
////  Created by Анастасія on 06.12.2022.
////
//
//import SwiftUI
//
//struct FruitList: View {
//
//    @EnvironmentObject var modelData: ModelData
//    
//    @State private var showChosenColor = false
//    @State var showSheet: Bool = false
//    @State var selectedColor: Food.Color = .allColor
//    
//    var filteredFruits: [Food] {
//        modelData.fruits.filter { fruit in
//            if selectedColor == .allColor { return true }
//            else { return fruit.color == selectedColor }
//        }
//    }
//        
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(filteredFruits, id: \.self) { fruit in
//                    NavigationLink {
//                        FruitDetail(food: fruit)
//                    } label: {
//                        FruitRow(food: fruit)
//                            .frame(height: 50)
//                    }
//                    .listStyle(.insetGrouped)
//                }
//                .onDelete(perform: delete)
//                .onMove(perform: move)
//            }
//            .navigationTitle("Fruits")
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    EditButton()
//                }
//                
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    filterButton
//                }
//            }
//        }
//    }
//        
//    var filterButton: some View {
//        Button {
//            showSheet.toggle()
//        } label: {
//            Image(systemName: "switch.2")
//        }
//        .sheet(isPresented: $showSheet) {
//            FilteredViewByColors(selectedColor: $selectedColor)
//        }
//    }
//    
//    func delete(indexSet: IndexSet) {
//        modelData.fruits.remove(atOffsets: indexSet)
//    }
//
//    func move(indices: IndexSet, newOffset: Int) {
//        modelData.fruits.move(fromOffsets: indices, toOffset: newOffset)
//    }
//}
//
//struct FruitList_Previews: PreviewProvider {
//    static var previews: some View {
//        FruitList()
//            .environmentObject(ModelData())
//    }
//}
