//
//  ModelData.swift
//  Fruits
//
//  Created by Анастасія on 06.12.2022.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var fruits: [Fruit] = load("FruitData.json")
}

func load<T: Decodable>(_ fileURL: String) -> T {
    let data: Data

    // check if the compile can find it
    guard let file = Bundle.main.url(forResource: fileURL, withExtension: nil)
    else {
        fatalError("Couldn't find \(fileURL) in main bundle")
    }

    // check empty file when we load it:
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(fileURL) from main bundle: \n\(error)")
    }

    // check if the compile can "read" the information:
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(fileURL) as \(T.self):\n\(error)")
    }
}
