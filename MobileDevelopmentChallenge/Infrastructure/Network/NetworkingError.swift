//
//  NetworkingError.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 29/01/25.
//

import Foundation

enum NetworkingError: Error {
    case encodingFailed(innerError: EncodingError)
    case decodingFailed(innerError: DecodingError)
    case invalidStatusCode(statusCode: Int)
    case requestFailed(innerError: URLError,errorCode:Int)
    case otherError(error:String)
    case invalidURL
    
    var userFriendlyMessage: String {
        switch self {
        case .requestFailed(_,let errorCode):
            switch errorCode {
            case -1009:
                return ErrorMessage.NoInternet
            case -1001:
                return ErrorMessage.TimedOut
            case -1000,-1002:
                return ErrorMessage.InvalidUrl
            default:
                return ErrorMessage.NetworkError
            }
            
        case .decodingFailed(_):
            return ErrorMessage.DecodingError

        case .encodingFailed(_):
            return ErrorMessage.EncodingError

        case .invalidStatusCode(let statusCode):
            return ErrorMessage.InvalidStatusCode.replacingOccurrences(of: "**", with: "\(statusCode)")

        case .invalidURL:
            return ErrorMessage.InvalidUrl

        case .otherError(let error):
            return error.isEmpty ? ErrorMessage.OtherError : error
        }
    }
}
