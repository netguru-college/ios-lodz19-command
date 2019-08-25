//
//  AppFlowCoordinator.swift
//  NetguruCollegeApp
//

import UIKit

final class AppFlowCoordinator: FlowCoordinator {

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func initializeApp() {
        rootViewController = UINavigationController()
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        runWelcomeScreen()
    }

    private func runWelcomeScreen() {
        let viewController = WelcomeViewController(delegate: self)
        rootViewController.show(viewController, sender: nil)
    }

    private func runMealViewController(with cousine: String) {
        let viewController = MealCollectionViewController(
            mealViewModel: MealViewModel(cousine: cousine),
            delegate: self
        )
        rootViewController.show(viewController, sender: nil)
    }

    private func runDetailsScreen(with meal: Meal) {
        let viewController = DetailViewController(viewModel: DefaultDetailViewModel(meal: meal))
        rootViewController.show(viewController, sender: nil)
    }
}

extension AppFlowCoordinator: WelcomeViewControllerDelegate {

    func didTapNext(with cousine: String) {
        runMealViewController(with: cousine)
    }
}

extension AppFlowCoordinator: MealCollectionViewControllerDelegate {

    func didSelectCell() {
        let mockMealJson = Meal(id: 633508,
                                image: "image2.jpg",
                                imageUrls: ["image2.jpg"],
                                readyInMinutes: 45,
                                serving: 6,
                                title: "Baked Cheese Manicotti"
        )
        let nextViewController = DetailViewController(viewModel: DefaultDetailViewModel(meal: mockMealJson))
        rootViewController.show(nextViewController, sender: nil)
    }
}
