//
//  Copyright © 2022 Anastasiia Ivashchenko. All rights reserved.
//

import SwiftUI

struct BasketEmpty: View {
    var body: some View {
        VStack {
            Text("This basket is empty.")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Color("DarkGreen"))
            
            Text("Please add some items in it.")
                .font(.headline)
                .foregroundColor(Color("DarkGreen"))
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(Color(uiColor: .lightGray))
    }
}

struct BasketEmpty_Previews: PreviewProvider {
    static var previews: some View {
        BasketEmpty()
    }
}
