//
//  JSONLoader.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 28/01/25.
//

import Foundation

class JSONLoader: JSONLoaderProtocol {
    func loadJSON(filename: String) -> Data? {
        if let url = Bundle.main.url(forResource: filename, withExtension: "json") {
            do {
                return try Data(contentsOf: url)
            } catch {
                print("Error loading local JSON file: \(error)")
            }
        }
        return nil
    }
}

