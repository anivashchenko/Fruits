//
//  Copyright © 2022 Anastasiia Ivashchenko. All rights reserved.
//

import Foundation

struct Food: Decodable, Hashable, Identifiable {
    static var countItem: Int = 0
    
    var id: Int
    var name: String
    var countValue: Int
    var isAddedToList: Bool
    var isBought: Bool
    var isFavorite: Bool
    var typeFood: TypeFood
    
    enum TypeFood: String, Decodable {
        case fruits
        case vegies
        case berries
    }
}
