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
        runMealViewController(with: "Italian")
    }

    private func runMealViewController(with cousine: String) {
        let viewController = MealCollectionViewController(mealViewModel: MealViewModel(cousine: cousine), delegate: self)
        rootViewController.show(viewController, sender: nil)
    }

    private func runDetailsScreen(with meal: Meal) {
        let viewController = DetailViewController(viewModel: DefaultDetailViewModel(meal: meal))
        rootViewController.show(viewController, sender: nil)
    }
}

extension AppFlowCoordinator: HelloWorldViewControllerDelegate {

    func didSelectNextButton() {
        let nextViewController = WelcomeViewController()
        rootViewController.show(nextViewController, sender: nil)
    }
}

extension AppFlowCoordinator: MealCollectionViewControllerDelegate {

    func didSelectCell() {
        //runDetailsScreen(with: Meal())
        print(self)
    }
}
