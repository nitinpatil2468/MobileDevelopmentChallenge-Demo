//
//  APIClient.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

class APIClient: APIClientProtocol {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
   
    func request<T>(url: String, method: HTTPMethod) async throws (NetworkingError) -> T where T : Decodable {
        do {
            guard let url = URL(string: url) else{
                throw NetworkingError.invalidURL
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                throw NetworkingError.invalidStatusCode(statusCode: -1)
            }
            
            guard (200...299).contains(statusCode) else {
                throw NetworkingError.invalidStatusCode(statusCode: statusCode)
            }
            return try JSONDecoder().decode(T.self, from: data)
        }catch let error as DecodingError {
            throw .decodingFailed(innerError: error)
        }
        catch let error as EncodingError {
            throw .encodingFailed(innerError: error)
        } catch let error as URLError {
            throw .requestFailed(innerError: error, errorCode: error.errorCode)
        } catch let error as NetworkingError {
            throw error
        } catch {
            throw .otherError(error: "")
        }
    }
}


