//
//  APIClientProtocol.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

protocol APIClientProtocol {
    func request<T: Decodable>(url: String, method: HTTPMethod) async throws -> T
}
