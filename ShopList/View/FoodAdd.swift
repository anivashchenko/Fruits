//
//  FoodAdd.swift
//  Fruits
//
//  Created by Анастасія on 08.12.2022.
//

import SwiftUI

struct FoodAdd: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var food: Food
    //@State var textField: String = ""
    //@State var count: Double = 0.0
    
    @State var countValue: Int = 0
    
//    var foodIndex: Int {
//        ModelData().fruits.firstIndex { $0.id == food.id }!
//        //modelData.landmarks.firstIndex(where: { $0.id == landmark.id } )!
//    }
    
    var body: some View {
        ZStack {
            GeometryReader { geomentry in
                VStack {
                    Text(food.name)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color("DarkGreen"))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .background(.thinMaterial)
                        .cornerRadius(10)
                        .offset(y: 20)
                    
                    Image(food.name)
                        .resizable()
                        .scaledToFit()
                        .clipped()
                        .offset(y: 20)
                }
                .frame(width: geomentry.size.width * 0.8)
                .offset(x: geomentry.size.width * 0.1)
                
                
                VStack {
                    Spacer()
                    
                    HStack {
                        FoodStepper(countValue: $countValue)
                        //FoodStepper(countValue: $modelData.fruits[foodIndex].countValue)
                            .padding(10)
                        
                        Spacer()
                        
                        Button {
                            if countIsSet() { addToList() }
                        } label: {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 80, height: 60)
                                .padding(20)
                                .overlay {
                                    Image(systemName: "basket.fill")
                                        .font(.title)
                                        .foregroundColor(.white)
                                }
                        }
                        .disabled(!countIsSet())
                        
                    }
                    
                } // END VSTACK
                .frame(height: 400)
                
            }
        }
        // END ZSTACK
        //.frame(height: 400)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.green.opacity(0.3))
    }
    
    func countIsSet() -> Bool {
        countValue > 0 ? true : false
    }
    
    func addToList() {
//        dataArray.append(textFieldText)
//        // add this to detete text in the field when you save it
//        textFieldText = ""
    }
}

struct FoodAdd_Previews: PreviewProvider {
    static var previews: some View {
        FoodAdd(food: ModelData().fruits[1])
            .environmentObject(ModelData())
    }
}
