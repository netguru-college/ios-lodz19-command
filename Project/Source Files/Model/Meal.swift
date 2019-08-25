//
//  Meal.swift
//  NetguruCollegeApp
//

struct Meal: Decodable {

    let id: Int

    let image: String

    let imageUrls: [String]

    let readyInMinutes: Int

    let servings: Int

    let title: String

}
