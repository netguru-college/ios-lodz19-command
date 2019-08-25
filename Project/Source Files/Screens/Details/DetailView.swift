//
//  DetailView.swift
//  NetguruCollegeApp
//

import UIKit

final class DetailView: UIView {
    // MARK: properties
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let detailsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 5
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let servingTimeRow: DetailInformationView = {
        let row = DetailInformationView(titleString: "Serving time: ")
        row.translatesAutoresizingMaskIntoConstraints = false
        return row
    }()
    private let secondRow: DetailInformationView = {
        let row = DetailInformationView(titleString: "Ready in minutes: ")
        row.translatesAutoresizingMaskIntoConstraints = false
        return row
    }()

    // MARK: initializers
    init() {
        super.init(frame: .zero)
        addSubviews()
        setupConstraints()
        backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func feedWith(_ meal: Meal) {
        let mealImage = UIImage(named: meal.image)
        imageView.image = mealImage

        servingTimeRow.feedWithValueString(valueString: "\(meal.serving)")
        secondRow.feedWithValueString(valueString: "\(meal.readyInMinutes)")
    }

    private func addSubviews() {
        addSubview(imageView)
        addSubview(detailsStackView)
        [servingTimeRow, secondRow].forEach(detailsStackView.addArrangedSubview)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.7)
        ])

        NSLayoutConstraint.activate([
                detailsStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
                detailsStackView.leftAnchor.constraint(equalTo: leftAnchor),
                detailsStackView.rightAnchor.constraint(equalTo: rightAnchor),
                detailsStackView.heightAnchor.constraint(equalToConstant: 90)
        ])

            servingTimeRow.heightAnchor.constraint(equalToConstant: 30).isActive = true
            secondRow.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
