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
        let viewController = HelloWorldViewController(delegate: self)
        rootViewController = UINavigationController(rootViewController: viewController)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
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

    func didSelectDetailViewButton() {
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
