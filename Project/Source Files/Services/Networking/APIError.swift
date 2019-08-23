//
//  APIError.swift
//  NetguruCollegeApp
//

import Foundation

struct ApiError: LocalizedError {

    private let description: String

    var errorDescription: String? {
        return description
    }

    init(_ description: String) {
        self.description = description
    }
}
