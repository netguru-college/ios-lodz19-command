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
        let navigationController = UINavigationController()
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "BodoniSvtyTwoITCTT-Bold", size: 17)!]
        rootViewController = navigationController
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
            mealViewModel: MealViewModel(cousine: cousine, numberOfOutputMeal: 10),
            delegate: self
        )
        viewController.title = cousine
        rootViewController.show(viewController, sender: nil)
    }

    private func runDetailsScreen(with meal: Meal, imageUrl: String) {
        let viewController = DetailViewController(viewModel: DefaultDetailViewModel(meal: meal, imageUrl: imageUrl))
        rootViewController.show(viewController, sender: nil)
    }
}

extension AppFlowCoordinator: WelcomeViewControllerDelegate {

    func didTapNext(with cousine: String) {
        runMealViewController(with: cousine)
    }
}

extension AppFlowCoordinator: MealCollectionViewControllerDelegate {
    func didFailWithRequest() {
        (rootViewController as? UINavigationController)?.popViewController(animated: true)
    }

    func didSelectCell(meal: Meal, imageUrl: String) {
       runDetailsScreen(with: meal, imageUrl: imageUrl)
    }
}
