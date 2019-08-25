//
//  Extensions+UIViewController.swift
//  NetguruCollegeApp
//


import UIKit

extension UIViewController {

    /// Public func to present UIAlertController.
    ///
    /// - Parameters:
    ///   - title: Alert title.
    ///   - message: Alert message.
    ///   - alertActionTitle: Title for alert action.
    func showAlert(title: String, message: String, alertActionTitle: String, completion: @escaping () -> Void) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let action = UIAlertAction(title: alertActionTitle, style: .cancel) { _ in
            completion()
        }
        alert.addAction(action)
        self.present(alert, animated: true)
    }

}
