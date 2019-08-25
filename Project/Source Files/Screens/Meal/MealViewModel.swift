//
//  MealViewModel.swift
//  NetguruCollegeApp
//

import UIKit

final class MealViewModel {

    var mealPhotos: [UIImage] = [#imageLiteral(resourceName: "testFood"), #imageLiteral(resourceName: "testFood"), #imageLiteral(resourceName: "testFood"), #imageLiteral(resourceName: "testFood"), #imageLiteral(resourceName: "testFood")]

    private let cousine: String

    init(cousine: String) {
        self.cousine = cousine
    }
}
