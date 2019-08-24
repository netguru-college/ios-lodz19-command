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
        super.loadView()
        let mealView = MealView()
        self.view = mealView
        NSLayoutConstraint.activate([
            mealView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mealView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mealView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mealView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let image = UIImage(named: "bla") else {
            return
        }
        mealImages.append(image)
        self.title = "MealViewController"
        customView.collectionView.register(MealCollectionViewCell.self, forCellWithReuseIdentifier: MealCollectionViewCell.name)
        customView.collectionView.backgroundColor = .red
        customView.collectionView.delegate = self
        customView.collectionView.dataSource = self
    }
    // MARK: UICollectionViewDataSource
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 0
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


extension MealCollectionViewController {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
