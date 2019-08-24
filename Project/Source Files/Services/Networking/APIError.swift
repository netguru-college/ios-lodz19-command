//
//  APIError.swift
//  NetguruCollegeApp
//

import Foundation

struct APIError: LocalizedError {

    private let description: String

    var errorDescription: String? {
        return description
    }

    init(_ description: String) {
        self.description = description
    }
}
