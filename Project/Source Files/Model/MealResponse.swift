//
//  MealResponse.swift
//  NetguruCollegeApp
//

struct MealResponse: Decodable {

    let results: [Meal]

    let baseUrl: String

}
