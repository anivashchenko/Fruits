//
//  Food.swift
//  Fruits
//
//  Created by Анастасія on 06.12.2022.
//

import Foundation

struct Food: Decodable, Hashable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var imageURL: String
    var mainland: String
    var color: Color
    var countValue: Int
    
    enum Color: String, Decodable {
        case yellow
        case orange
        case red
        case green
        case allColor
    }
}
