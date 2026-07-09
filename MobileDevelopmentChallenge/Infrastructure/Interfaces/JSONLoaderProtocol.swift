//
//  JSONLoaderProtocol.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 28/01/25.
//

import Foundation

protocol JSONLoaderProtocol {
    func loadJSON(filename: String) -> Data?
}

