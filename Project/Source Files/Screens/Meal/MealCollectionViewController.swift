//
//  MealCollectionViewController.swift
//  NetguruCollegeApp
//

import UIKit

protocol MealCollectionViewControllerDelegate: AnyObject {
    func didSelectCell(meal: Meal, imageUrl: String)
}

final class MealCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    private let viewModel: MealViewModel

    private weak var delegate: MealCollectionViewControllerDelegate?

    private var customView: MealView {
        return view as! MealView
    }

    init(mealViewModel: MealViewModel, delegate: MealCollectionViewControllerDelegate?) {
        self.delegate = delegate
        self.viewModel = mealViewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = MealView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.cousine
        customView.collectionView.register(
            MealCollectionViewCell.self,
            forCellWithReuseIdentifier: MealCollectionViewCell.name
        )
        customView.collectionView.dataSource = self
        customView.collectionView.delegate = self
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white

        customView.setBlurLoader()
        viewModel.getMealFromRequest { [weak self] didSucceed in
            DispatchQueue.main.async {
                self?.customView.removeBlurLoader()
                guard didSucceed else { return }
                self?.customView.collectionView.reloadData()
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.meals.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MealCollectionViewCell.name, for: indexPath) as? MealCollectionViewCell else {
            fatalError("MealCollectionViewCell was not found")
        }
        let meal = viewModel.meals[indexPath.item]
        let fullUrl = viewModel.baseUrl + meal.image
        if let url = URL(string: fullUrl) {
            cell.mealImageView.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "meal-placeholder"))
        } else {
            cell.mealImageView.image = #imageLiteral(resourceName: "meal-placeholder")
        }
        return cell
    }
}

extension MealCollectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = customView.collectionView.bounds.width * 0.3
        let yourHeight = yourWidth

        return CGSize(width: yourWidth, height: yourHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(
            top: customView.collectionView.bounds.width * 0.02,
            left: customView.collectionView.bounds.width * 0.02,
            bottom: customView.collectionView.bounds.width * 0.02,
            right: customView.collectionView.bounds.width * 0.02
        )
    }

}

extension MealCollectionViewController {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let meal = viewModel.meals[indexPath.item]
        delegate?.didSelectCell(meal: viewModel.meals[indexPath.item], imageUrl: viewModel.baseUrl + meal.image)
    }
}
