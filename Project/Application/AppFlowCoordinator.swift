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
        let viewController = WelcomeViewController()
        rootViewController.show(viewController, sender: nil)
    }

    private func runDetailsScreen(with meal: Meal) {
        let viewController = DetailViewController(viewModel: DefaultDetailViewModel(meal: meal))
        rootViewController.show(viewController, sender: nil)
    }
}

extension AppFlowCoordinator: WelcomeViewControllerDelegate {

    func didTapNext(with cousine: String) {
        /// TODO: Show Meals screen.
    }
}
