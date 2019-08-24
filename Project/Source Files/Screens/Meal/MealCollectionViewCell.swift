//
//  MealCollectionViewCell.swift
//  NetguruCollegeApp
//


import UIKit

class MealCollectionViewCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(mealImageView)
        NSLayoutConstraint.activate([
            mealImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mealImageView.leftAnchor.constraint(equalTo: leftAnchor),
            mealImageView.rightAnchor.constraint(equalTo: rightAnchor),
            mealImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let mealImageView: UIImageView = {
        var mealImageView = UIImageView()
        mealImageView.translatesAutoresizingMaskIntoConstraints = true
        return mealImageView
    }()

}
extension MealCollectionViewCell {
    static let name: String =  "MealCollectionViewCell"
}
