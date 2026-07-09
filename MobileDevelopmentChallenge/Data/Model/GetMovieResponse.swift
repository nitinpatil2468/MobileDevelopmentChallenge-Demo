//
//  MovieListResponse.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation


// MARK: - GetMovieResponse
struct GetMovieResponse: Codable {
    let docs: [MovieData]?
    let total, limit, offset, page: Int?
    let pages: Int?
    let error: ErrorData?
}

// MARK: - MovieData
struct MovieData: Codable {
    let id, name: String?
    let runtimeInMinutes, budgetInMillions: Int?
    let boxOfficeRevenueInMillions: Double?
    let academyAwardNominations, academyAwardWINS: Int?
    let rottenTomatoesScore: Double?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, runtimeInMinutes, budgetInMillions, boxOfficeRevenueInMillions, academyAwardNominations
        case academyAwardWINS = "academyAwardWins"
        case rottenTomatoesScore
    }
}
