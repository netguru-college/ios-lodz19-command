//
//  MealViewModel.swift
//  NetguruCollegeApp
//

import UIKit

class MealViewModel {
    
    var mealPhotos: [UIImage] = [#imageLiteral(resourceName: "testFood")]
    
    private let cousine: String
    
    init(cousine: String) {
        self.cousine = cousine
    }
    
    func fetchMeals() {
        /// request
    }
}
