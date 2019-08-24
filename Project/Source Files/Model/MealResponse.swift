//
//  MealResponse.swift
//  NetguruCollegeApp
//


import Foundation

struct MealResponse: Decodable {
    let results: [Meal]
    let baseUrl: String
}
