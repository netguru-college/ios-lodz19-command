//
//  MealCollectionViewController.swift
//  NetguruCollegeApp
//

import UIKit

protocol MealCollectionViewControllerDelegate: AnyObject {
    func didSelectCell()
}

class MealCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var mealImages = [UIImage]()
    private weak var delegate: MealCollectionViewControllerDelegate?

    private var customView: MealView {
        return view as! MealView
    }

    init(delegate: MealCollectionViewControllerDelegate?) {
        self.delegate = delegate
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
        
        mealImages.append(#imageLiteral(resourceName: "testFood"))
        self.title = "MealViewController"
        customView.collectionView.register(MealCollectionViewCell.self, forCellWithReuseIdentifier: MealCollectionViewCell.name)
        customView.collectionView.dataSource = self
        customView.collectionView.delegate = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mealImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MealCollectionViewCell.name, for: indexPath) as? MealCollectionViewCell else {
            fatalError("MealCollectionViewCell was not found")
        }
        cell.mealImageView.image = mealImages[indexPath.row]
        return cell
    }
}

extension MealCollectionViewController {

     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectCell()
    }
}
