//
//  ApiProvider+.swift
//  MasterCoin
//
//  Created by Nikolas Gianoglou Coelho on 11/03/22.
//

import Foundation

typealias ApiProviderFailureHandler = (ApiError) -> Void

extension ApiProvider {
    func sendRequest<T: Decodable>(to url: String,
                                   with parameters: [AnyHashable: Any],
                                   expecting: [T].Type,
                                   completion: @escaping (Result<[T], Error>) -> Void) {
        self.request(parameters: parameters, finalUrl: url) { result in
            do {
                let result = try result()
                let apiResponse = try JSONDecoder().decode(expecting, from: result.data)
                completion(.success(apiResponse))
                DebugLogger.log(result.data.prettyPrintedJSONString())
            } catch {
                DebugLogger.log(error)
                completion(.failure(error))
            }
            
        }
    }
    
}
