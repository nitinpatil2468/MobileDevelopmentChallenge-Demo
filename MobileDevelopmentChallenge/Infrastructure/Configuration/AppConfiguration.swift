//
//  AppConfiguration.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 28/01/25.
//

import Foundation


class AppConfiguration: ConfigurationProtocol {
    var localMovieFileName: String {
        return "movie_list"
    }
    
    var localCharacterFileName: String {
        return "character_list"
    }
    
    var localQuoteFileName: String {
        return "quote_list"
    }
}

