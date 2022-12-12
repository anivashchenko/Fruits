//
//  Copyright © 2022 Anastasiia Ivashchenko. All rights reserved.
//

import SwiftUI

struct InformationScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var delay: Double = 1
    @State var topic: Topic = .basket
    
    enum Topic: String {
        case basket = "Successfully added to shop list!"
        case list = "This type of list has already chosen!"
    }
    
    var body: some View {
        Text(topic.rawValue)
            .font(.title2)
            .foregroundColor(Color("DarkGreen"))
            .bold()
            .frame(width: 300, height: 100)
            .multilineTextAlignment(.center)
            .background(
                Color(uiColor: .quaternarySystemFill)
                    .cornerRadius(10)
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.thinMaterial)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    presentationMode.wrappedValue.dismiss()
                }
            }
    }
}

struct InformationScreen_Previews: PreviewProvider {
    static var previews: some View {
        InformationScreen()
    }
}
