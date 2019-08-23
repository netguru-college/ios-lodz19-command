//
//  WelcomeViewController.swift
//  NetguruCollegeApp
//

import UIKit

final class WelcomeViewController: UIViewController {

    private var customView: WelcomeView {
        return view as! WelcomeView
    }

    // MARK: - Functions

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = WelcomeView.instanceFromNib()
    }
}
