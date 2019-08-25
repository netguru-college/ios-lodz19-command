//
//  MealCollectionViewCell.swift
//  NetguruCollegeApp
//

import UIKit

final class MealCollectionViewCell: UICollectionViewCell {

    static let name =  "MealCollectionViewCell"

    let mealImageView: UIImageView = {
        let mealImageView = UIImageView()
        mealImageView.contentMode = .scaleAspectFill
        mealImageView.translatesAutoresizingMaskIntoConstraints = false
        return mealImageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.masksToBounds = true
        addSubview(mealImageView)
        NSLayoutConstraint.activate([
            mealImageView.topAnchor.constraint(equalTo: topAnchor),
            mealImageView.leftAnchor.constraint(equalTo: leftAnchor),
            mealImageView.rightAnchor.constraint(equalTo: rightAnchor),
            mealImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
