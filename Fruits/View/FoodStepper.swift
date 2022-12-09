//
//  FoodStepper.swift
//  Fruits
//
//  Created by Анастасія on 08.12.2022.
//

import SwiftUI

struct FoodStepper: View {
    
    @Binding var countValue: Int
    @State var widthIncrement: CGFloat = 0
    
    //@AppStorage("count") var currentCount: Int?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("MyOrange"))
                .frame(width: 150, height: 50)
            
            HStack(spacing: 0) {
                Button {
                    if countIsPositive() {
                        incrementWidth(amount: -1)
                    }
                } label: {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color("MyOrange"))
                        .frame(width: 50, height: 50)
                        .padding(10)
                        .overlay {
                            Image(systemName: "minus")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                }
                .disabled(!countIsPositive())
                
                Text("\(countValue)")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                
                Button {
                    incrementWidth(amount: 1)
                } label: {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color("MyOrange"))
                        .frame(width: 50, height: 50)
                        .padding(10)
                        .overlay {
                            Image(systemName: "plus")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                        
                }
            } // END HSTACK
        } // END ZSTACK
        .frame(width: 170, height: 80)
    }
    
    func incrementWidth(amount: CGFloat) {
        withAnimation(.easeInOut) {
            widthIncrement += amount

            let countString = String(format: "%.0f", widthIncrement)
            countValue = Int(countString) ?? 0            
        }
    }
    
    func countIsPositive() -> Bool {
        widthIncrement >= 1 ? true : false
    }
}

struct FoodStepper_Previews: PreviewProvider {
    static var previews: some View {
        FoodStepper(countValue: .constant(1))
    }
}
