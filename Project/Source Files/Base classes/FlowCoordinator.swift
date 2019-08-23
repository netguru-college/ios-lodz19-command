//
//  FlowCoordinator.swift
//  NetguruCollegeApp
//

import UIKit

class FlowCoordinator {

    /// Next flow coordinator in a stack
    var nextFlowCoordinator: FlowCoordinator?

    /// Root view controller of the given flow
    var rootViewController: UIViewController = UIViewController()
}
