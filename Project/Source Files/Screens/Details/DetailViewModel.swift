//
//  DetailViewModel.swift
//  NetguruCollegeApp
//

import UIKit

protocol DetailViewModel {
    var meal: Meal { get }
    var imageUrl: String { get }
    func getInstructions(complition: @escaping ([Step]) -> Void)
}

final class DefaultDetailViewModel: DetailViewModel {
    let imageUrl: String
    let meal: Meal
    private let apiClient = APIClient()

    init(meal: Meal, imageUrl: String ) {
        self.meal = meal
        self.imageUrl = imageUrl
    }

    func getInstructions(complition: @escaping ([Step]) -> Void) {
        let request = InstructionsRequest(id: meal.id)
        apiClient.sendRequestAndDecode(
            request: request,
            success: { (instructions: [Instructions]) in
                guard let firstInstruction = instructions.first else {
                    complition([])
                    return
                }
                complition(firstInstruction.steps)
            }
        ) { error in
            print(error!)
            complition([])
        }
    }
}
