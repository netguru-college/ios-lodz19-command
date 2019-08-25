//
//  DetailViewModel.swift
//  NetguruCollegeApp
//

import UIKit

protocol DetailViewModel {
    var meal: Meal { get }
    var imageUrl: String { get }
}

final class DefaultDetailViewModel: DetailViewModel {
    let imageUrl: String
    let meal: Meal

    init(meal: Meal, imageUrl: String ) {
        self.meal = meal
        self.imageUrl = imageUrl
    }
}
