//
//  Food.swift
//  ShopList
//
//  Created by Анастасія on 06.12.2022.
//

import Foundation

struct Food: Decodable, Hashable, Identifiable {
    static var countItem: Int = 0
    
    var id: Int
    var name: String
    var countValue: Int
    var isAddedToList: Bool
    var isFavorite: Bool
    var typeFood: TypeFood
    
    enum TypeFood: String, Decodable {
        case fruits
        case vegies
        case berries
    }
}
