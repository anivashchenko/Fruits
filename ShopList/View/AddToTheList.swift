//
//  Copyright © 2022 Anastasiia Ivashchenko. All rights reserved.
//

import SwiftUI

struct AddToTheList: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var topic: Topic = .list
    
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
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    presentationMode.wrappedValue.dismiss()
                }
            }
    }
}

struct AddToTheList_Previews: PreviewProvider {
    static var previews: some View {
        AddToTheList()
    }
}
