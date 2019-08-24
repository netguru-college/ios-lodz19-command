//
//  HelloWorldViewController.swift
//  NetguruCollegeApp
//

import UIKit

protocol HelloWorldViewControllerDelegate: AnyObject {
    func didSelectNextButton()
    func didSelectDetailViewButton()
}

class HelloWorldViewController: UIViewController {

    private var customView: HelloWorldView {
        return view as! HelloWorldView
    }

    private weak var delegate: HelloWorldViewControllerDelegate?

    // MARK: - Functions

    init(delegate: HelloWorldViewControllerDelegate?) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = HelloWorldView.instanceFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        customView.nextButton.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
        customView.showDetailViewButton.addTarget(self, action: #selector(showDetailViewAction), for: .touchUpInside)
    }

    @objc func nextAction() {
        delegate?.didSelectNextButton()
    }
    @objc func showDetailViewAction() {
        delegate?.didSelectDetailViewButton()
    }
}
