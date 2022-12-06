//
//  Fruit.swift
//  Fruits
//
//  Created by Анастасія on 06.12.2022.
//

import Foundation

struct Fruit: Decodable, Hashable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var imageURL: String
    var country: String
}
