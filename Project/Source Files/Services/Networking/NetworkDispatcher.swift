//
//  NetworkDispatcher.swift
//  NetguruCollegeApp
//

import Foundation

protocol Dispatcher {

    /// Dispatches URLRequest and calls a handler with given Decodable Type
    /// upon completion.
    ///
    /// - Parameters:
    ///   - urlRequest: UrlRequest to dispatch.
    ///   - completion: Completion handler.
    func execute<T: Decodable>(urlRequest: URLRequest, completion: @escaping ((Result<T, Error>) -> Void))
}

final class NetworkDispatcher: NSObject, Dispatcher {

    private lazy var defaultUrlSession = URLSession(configuration: .default)

    func execute<T: Decodable>(urlRequest: URLRequest, completion: @escaping ((Result<T, Error>) -> Void)) {

        // Create dataTask with completion handler.
        let dataTask = defaultUrlSession.dataTask(with: urlRequest) { data, response, error in
            // Check if there was eny error and if so call completion with .failure response.
            if let error = error {
                completion(.failure(error))
            }
            // If there are no errors, unwrap data, decode it with a given Decodable type
            // and call completion depending on decoding's result.
            else if let data = data {
                do {
                    let encodable = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(encodable))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        // Resume the task.
        dataTask.resume()
    }
}
