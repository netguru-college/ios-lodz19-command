//
//  DetailView.swift
//  NetguruCollegeApp
//

import UIKit

//TODO: extract subview to separate class
final class DetailView: UIView {
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageVie
    }()

    private let detailsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .green
        stackView.spacing = 5
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let firstRow: DetailInformationView = {
        let firstRow = DetailInformationView(titleString: "Serving time: ")
        firstRow.translatesAutoresizingMaskIntoConstraints = false
        return firstRow
    }()
    private let secondRow: DetailInformationView = {
        let secondRow = DetailInformationView(titleString: "Ready in minutes: ")
        secondRow.translatesAutoresizingMaskIntoConstraints = false
        return secondRow
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

        firstRow.feedWithValueString(valueString: "\(meal.serving)")
        secondRow.feedWithValueString(valueString: "\(meal.readyInMinutes)")
    }

    private func addSubviews() {
        addSubview(imageView)
        addSubview(detailsStackView)
        [firstRow, secondRow].forEach(detailsStackView.addArrangedSubview)
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

            firstRow.heightAnchor.constraint(equalToConstant: 30).isActive = true
            secondRow.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
}
