//
//  RandomMealRequest.swift
//  NetguruCollegeApp
//

import Foundation

struct RandomMealRequest: APIRequest {

    var path: String = "recipes/search"

    var method: APIMethod = .get

    var parameters: [String: String]? {
        return [
            "cuisine": cuisine,
            "number": "\(number)"
        ]
    }

    let cuisine: String

    let number: Int

}
