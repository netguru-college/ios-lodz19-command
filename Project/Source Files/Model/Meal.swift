//
//  Meal.swift
//  NetguruCollegeApp
//

struct Meal: Decodable {

    let id: Int

    let image: String

    let imageUrls: [String]

    let readyInMinutes: Int

    let serving: Int

    let title: String

}
