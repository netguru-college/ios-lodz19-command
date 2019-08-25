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
    private var generatedCousine: String? {
        didSet {
            customView.cusineLabel.text = generatedCousine
            customView.nextScreenButton.isHidden = generatedCousine == nil
        }
    }
    init(delegate: WelcomeViewControllerDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
        setupCallBacks()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        generatedCousine = nil
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func loadView() {
        view = WelcomeView.instanceFromNib()
    }
    override func viewDidLoad() {
        customView.nextScreenButton.layer.cornerRadius = 5
    }
    private func setupCallBacks () {
        customView.randomButton.addTarget(self, action: #selector(didTapRandomButton), for: .touchUpInside)
        customView.nextScreenButton.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
    }

    @objc private func didTapRandomButton() {
        let newGenerator = CuisineGenerator()
        generatedCousine = newGenerator.getRandom()
    }

    @objc private func didTapNext() {
        guard let cousine = generatedCousine else { return }
        delegate?.didTapNext(with: cousine)
    }
}
