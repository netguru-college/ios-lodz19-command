//
//  DetailViewController.swift
//  NetguruCollegeApp
//

import UIKit

final class DetailViewController: UIViewController {

    private var customView: DetailView {
        return view as! DetailView
    }

    private let viewModel: DetailViewModel

    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: viewModel.imageUrl ) else { return }
        customView.imageView.kf.setImage(with: url)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        let detailView = DetailView()
        detailView.feedWith(viewModel.meal)
        view = detailView
    }
}
