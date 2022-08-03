//
//  API.swift
//  Pokedex
//
//  Created by Locação on 02/08/22.
//

import Foundation

typealias SuccessResult<T: Decodable> = (T) -> Void
typealias FailureResult = (APIError) -> Void

class API {
    let baseUrl = "https://pokeapi.co/api/v2/"
    
    func request<T: Decodable>(
        endpoint: Endpoint,
        method: HTTPMethod = .get,
        success: @escaping SuccessResult<T>,
        failure: @escaping FailureResult
    ) {
        guard var url = URL(string: baseUrl) else {
            failure(.badUrl(string: baseUrl))
            return
        }
        
        url.appendPathComponent(endpoint.url)
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
           
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                failure(.requestFailed(error: error))
                return
            }
            
            guard let data = data else {
                failure(.invalidData)
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                success(decodedData)
            } catch {
                failure(.decodeFailed(error: error, textData: String(data: data, encoding: .utf8)))
            }
        }.resume()
        
    }
    
}
