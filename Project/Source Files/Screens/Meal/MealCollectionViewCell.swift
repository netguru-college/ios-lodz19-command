//
//  MealCollectionViewCell.swift
//  NetguruCollegeApp
//


import UIKit

class MealCollectionViewCell: UICollectionViewCell {
    
    init() {
        super.init(frame: .zero)
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
        return mealImageView
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
extension MealCollectionViewCell {
    static let name: String =  "MealCollectionViewCell"
}
