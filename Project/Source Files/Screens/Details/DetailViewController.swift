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

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        let detailView = DetailView()
        detailView.feedWith(viewModel.meal)
        view = detailView
    }
}
