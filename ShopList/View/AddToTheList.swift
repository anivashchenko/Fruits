//
//  Copyright © 2022 Anastasiia Ivashchenko. All rights reserved.
//

import SwiftUI

struct AddToTheList: View {
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Text("Successfully added to shop list!")
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
