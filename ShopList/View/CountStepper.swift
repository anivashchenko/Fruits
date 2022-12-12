//
//  Copyright © 2022 Anastasiia Ivashchenko. All rights reserved.
//

import SwiftUI

struct CountStepper: View {
    
    @Binding var countValue: Int
    @State var countValueFloat: CGFloat = 0
    @State var getCount: () -> ()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("MyOrange"))
                .frame(width: (140 + countValueFloat/10), height: 50)
            
            HStack(spacing: 10) {
                Button {
                    if countIsPositive() {
                        incrementWidth(amount: -1)
                    }
                } label: {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color("MyOrange"))
                        .frame(width: 50, height: 50)
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
                        .overlay {
                            Image(systemName: "plus")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                }
            } // END HSTACK
        } // END ZSTACK
        .frame(width: 170, height: 80)
        .onAppear(perform: getCount)
    }
    
    func incrementWidth(amount: Int) {
        withAnimation(.easeInOut) {
            countValue += amount
            countValueFloat = CGFloat(integerLiteral: amount)
        }
    }
    
    func countIsPositive() -> Bool {
        countValue > 0 ? true : false
    }
}

struct CountStepper_Previews: PreviewProvider {
    static func getCount() {}
    
    static var previews: some View {
        CountStepper(countValue: .constant(0), getCount: getCount)
            .environmentObject(ModelData())
    }
}
