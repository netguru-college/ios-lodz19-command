//
//  DetailViewModel.swift
//  NetguruCollegeApp
//

protocol DetailViewModel {
    var meal: Meal { get }
}

final class DefaultDetailViewModel: DetailViewModel {

    let meal: Meal

    public init(meal: Meal) {
        self.meal = meal
    }
}
