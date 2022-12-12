//
//  Copyright © 2022 Anastasiia Ivashchenko. All rights reserved.
//

import SwiftUI

struct BasketEmpty: View {
    var body: some View {
        Text("This basket is empty. \nPlease add item in it.")
            .font(.title2)
            .bold()
            .foregroundColor(Color("DarkGreen"))
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .background(Color(uiColor: .secondarySystemFill))
    }
}

struct BasketEmpty_Previews: PreviewProvider {
    static var previews: some View {
        BasketEmpty()
    }
}
