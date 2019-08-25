//
//  MealViewModel.swift
//  NetguruCollegeApp
//

import UIKit
import Kingfisher

final class MealViewModel {

    var baseUrl: String = ""

    var meals: [Meal] = []

    let cousine: String

    private let apiClient = APIClient()

    private let numberOfOutputMeal: Int

    init(cousine: String, numberOfOutputMeal: Int) {
        self.cousine = cousine
        self.numberOfOutputMeal = numberOfOutputMeal
    }

    func getMealFromRequest(complition: @escaping (Bool) -> Void) {
        let request = RandomMealRequest(cuisine: cousine, number: numberOfOutputMeal)
        apiClient.sendRequestAndDecode(
            request: request,
            success: { [weak self] (mealResponse: MealResponse) in
                self?.baseUrl = mealResponse.baseUri
                self?.meals = mealResponse.results
                complition(true)
            }
        ) { _ in
            complition(false)
        }
    }
}
