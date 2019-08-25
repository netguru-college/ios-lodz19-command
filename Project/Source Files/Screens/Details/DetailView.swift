//
//  DetailView.swift
//  NetguruCollegeApp
//

import UIKit

final class DetailView: UIView {

    // MARK: properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 4
        return imageView
    }()

    private let detailsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 4
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let servingTimeRow: DetailInformationView = {
        let row = DetailInformationView(iconName: "plate.png")
        row.translatesAutoresizingMaskIntoConstraints = false
        return row
    }()
    
    private let readyInMinutesRow: DetailInformationView = {
        let row = DetailInformationView(iconName: "clock.jpg")
        row.translatesAutoresizingMaskIntoConstraints = false
        return row
    }()

    // MARK: initializers
    init() {
        super.init(frame: .zero)
        addSubviews()
        setupConstraints()
        backgroundColor = #colorLiteral(red: 0.9369841218, green: 0.3454609811, blue: 0.1157674268, alpha: 1)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func feedWith(_ meal: Meal) {
        let mealImage = UIImage(named: meal.image)
        imageView.image = mealImage
        servingTimeRow.feedWithValueString(valueString: "\(meal.servings)")
        readyInMinutesRow.feedWithValueString(valueString: " \(meal.readyInMinutes) minutes")
        titleLabel.text = meal.title
    }

    private func addSubviews() {
        [imageView, titleLabel, detailsStackView].forEach(addSubview)
        [servingTimeRow, readyInMinutesRow].forEach(detailsStackView.addArrangedSubview)
    }

    private func setupConstraints() {
        // pin title label
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10)
        ])

        // pin image view
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.7)
        ])

        // pin detail stack view
        NSLayoutConstraint.activate([
            detailsStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            detailsStackView.leftAnchor.constraint(equalTo: leftAnchor),
            detailsStackView.rightAnchor.constraint(equalTo: rightAnchor),
            detailsStackView.heightAnchor.constraint(equalToConstant: 30)
        ])

        [servingTimeRow, readyInMinutesRow].forEach { $0.heightAnchor.constraint(equalToConstant: 30).isActive = true }
    }
}
