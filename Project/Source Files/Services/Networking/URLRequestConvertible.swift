//
//  URLRequestConvertible.swift
//  NetguruCollegeApp
//

import Foundation

protocol URLRequestConvertible {

    /// Transforms conforming value to URLRequest
    ///
    /// - Returns: URLRequest
    func asURLRequest() -> URLRequest
}

extension URLRequestConvertible where Self: Request {

    func asURLRequest() -> URLRequest {
        // Create urlString out of basePath, apiPath and path.
        var urlString = basePath
            .appending(apiPath)
            .appending(path)
        // Add parameters to urlString if there are any.
        if let parameters = parameters, !parameters.isEmpty {
            urlString.append("?")
            parameters.forEach {
                urlString.append("/\($0.key)=\($0.value)")
            }
        }
        // Create URL out of urlString.
        guard let url = URL(string: urlString) else {
            fatalError("Could not initialize URL with path: \(urlString)")
        }
        // Wrap URL into URLRequest struct.
        var urlRequest = URLRequest(url: url)
        // Add body to urlRequest if there is any.
        if let body = body {
            do {
                let data = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
                urlRequest.httpBody = data
            } catch {
                fatalError(error.localizedDescription)
            }
        }
        // Add headers to urlRequest if there are any.
        headers?.forEach {
            urlRequest.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        // Assign approptiate HTTP method.
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}
