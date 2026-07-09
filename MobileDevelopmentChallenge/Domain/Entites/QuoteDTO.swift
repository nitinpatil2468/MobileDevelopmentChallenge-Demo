//
//  QuoteDto.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

struct QuoteDto: Identifiable,Equatable {
    let id: String
    let dialog: String
    let movieId: String
    let characterId: String
    
    init(quote: QuoteData) {
        self.id = quote.id ?? ""
        self.dialog = quote.dialog ?? ""
        self.movieId = quote.movie ?? ""
        self.characterId = quote.character ?? ""
    }
}
