//
//  APIEndPoint.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

enum APIEndPoint{
    
    case fetchMovies
    case fetchCharacters
    case fetchQuotes
    
    var path: String{
        let baseUrl = "https://e21a086a-4f08-425a-b99c-a9bbe7539a40.mock.pstmn.io/v2"
        var servicePath = ""
        
        switch self {
        case .fetchMovies:
            servicePath = "/movie"
            
        case .fetchCharacters:
            servicePath = "/character"
            
        case .fetchQuotes:
            servicePath = "/quote"
            
        }
        return baseUrl + servicePath
    }
}
