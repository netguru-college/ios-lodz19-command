//
//  AppDelegate.swift
//  NetguruCollegeApp
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appFlowController: AppFlowCoordinator?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
        ) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        let navigationBarApperiance = UINavigationBar.appearance()
        navigationBarApperiance.tintColor = .white
        navigationBarApperiance.barTintColor = .black
        navigationBarApperiance.shadowImage = UIImage()
        appFlowController = AppFlowCoordinator(window: window)
        appFlowController?.initializeApp()

        return true
    }
}
