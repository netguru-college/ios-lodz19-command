//
//  DetailViewModel.swift
//  NetguruCollegeApp
//

protocol DetailViewModel {
    var meal: Meal { get }
}

final class DefaultDetailViewModel: DetailViewModel {

    let meal: Meal

    init(meal: Meal) {
        self.meal = meal
    }
}
