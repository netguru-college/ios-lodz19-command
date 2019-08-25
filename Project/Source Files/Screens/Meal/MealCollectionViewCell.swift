//
//  MealCollectionViewCell.swift
//  NetguruCollegeApp
//

import UIKit

final class MealCollectionViewCell: UICollectionViewCell {

    static let name =  "MealCollectionViewCell"

    let mealImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = #colorLiteral(red: 0.9369841218, green: 0.3454609811, blue: 0.1157674268, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
