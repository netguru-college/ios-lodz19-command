//
//  CuisineGenerator.swift
//  NetguruCollegeApp
//

import Foundation

class CuisineGenerator {

    private let cuisineList: [String] = [
        "African",
        "American",
        "British",
        "Cajun",
        "Caribbean",
        "Chinese",
        "Eastern European",
        "European",
        "French",
        "German",
        "Greek",
        "Indian",
        "Irish",
        "Italian",
        "Japanese",
        "Jewish",
        "Korean",
        "Latin American",
        "Mediterranean",
        "Mexican",
        "Middle Eastern",
        "Nordic",
        "Southern",
        "Spanish",
        "Thai",
        "Vietnamese"]

    /// Get random cuisine name.
    ///
    /// - Returns: Name of random cuisine.
    func getRandom() -> String? {
        return cuisineList.randomElement()
    }

}
