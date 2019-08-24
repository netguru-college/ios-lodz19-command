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
        setupCallBacks()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = WelcomeView.instanceFromNib()
    }

    private func setupCallBacks () {
        customView.randomButton.addTarget(self, action: #selector(didTapRandomButton), for: .touchUpInside)
    }

    @objc private func didTapRandomButton() {
        let newGenerator = CuisineGenerator()
        customView.cusineLabel.text = newGenerator.getRandom()
    }
}
