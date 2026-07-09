//
//  MovieDTO.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

struct MovieDTO: Identifiable,Equatable{
    let id: String
    let name: String
    let rating: String  
    
    init(movie: MovieData) {
        self.id = movie.id ?? ""
        self.name = movie.name ?? ""
        self.rating = String(Int(movie.rottenTomatoesScore ?? 0.0)) 
    }
}
