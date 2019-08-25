//
//  WelcomeViewController.swift
//  NetguruCollegeApp
//

import UIKit

protocol WelcomeViewControllerDelegate: AnyObject {
    func didTapNext(with cousine: String)
}

final class WelcomeViewController: UIViewController {

    weak var delegate: WelcomeViewControllerDelegate?

    private var customView: WelcomeView {
        return view as! WelcomeView
    }

    private var generatedCousine: String?

    init(delegate: WelcomeViewControllerDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
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
        customView.nextScreenButton.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
    }

    @objc private func didTapRandomButton() {
        let newGenerator = CuisineGenerator()
        generatedCousine = newGenerator.getRandom()
        customView.cusineLabel.text = generatedCousine
    }

    @objc private func didTapNext() {
        guard let cousine = generatedCousine else { return }
        delegate?.didTapNext(with: cousine)
    }
}
