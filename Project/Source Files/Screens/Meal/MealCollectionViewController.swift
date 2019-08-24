//
//  MealCollectionViewController.swift
//  NetguruCollegeApp
//

import UIKit

protocol MealCollectionViewControllerDelegate: AnyObject {
    func didSelectCell()
}

class MealCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
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
        title = "MealViewController"
        customView.collectionView.register(MealCollectionViewCell.self, forCellWithReuseIdentifier: MealCollectionViewCell.name)
        customView.collectionView.dataSource = self
        customView.collectionView.delegate = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.mealPhotos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MealCollectionViewCell.name, for: indexPath) as? MealCollectionViewCell else {
            fatalError("MealCollectionViewCell was not found")
        }
        cell.mealImageView.image = viewModel.mealPhotos[indexPath.row]
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
        return UIEdgeInsets(top:  customView.collectionView.bounds.width * 0.02,
                            left:  customView.collectionView.bounds.width * 0.02,
                            bottom:  customView.collectionView.bounds.width * 0.02,
                            right: customView.collectionView.bounds.width * 0.02)
    }

}

extension MealCollectionViewController {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectCell()
    }
}
