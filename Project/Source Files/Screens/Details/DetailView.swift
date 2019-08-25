//
//  DetailView.swift
//  NetguruCollegeApp
//

import UIKit

final class DetailView: UIView {

    // MARK: properties

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

    private let stepsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 4
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var firstLabel = makeLabel()
    private lazy var secondLabel = makeLabel()
    private lazy var thirdLabel = makeLabel()

    private let servingTimeRow: DetailInformationView = {
        let row = DetailInformationView(iconName: "dish.png")
        row.translatesAutoresizingMaskIntoConstraints = false
        return row
    }()

    private let readyInMinutesRow: DetailInformationView = {
        let row = DetailInformationView(iconName: "clock.png")
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
        servingTimeRow.feedWithValueString(valueString: "\(meal.servings) people")
        readyInMinutesRow.feedWithValueString(valueString: " \(meal.readyInMinutes) minutes")
    }

    func makeLabel() -> UILabel {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.textColor = .white
        return lable
    }

    private func addSubviews() {
        [imageView, detailsStackView, stepsStackView].forEach(addSubview)
        [servingTimeRow, readyInMinutesRow].forEach(detailsStackView.addArrangedSubview)
        [firstLabel, secondLabel, thirdLabel].forEach(stepsStackView.addArrangedSubview)
    }

    private func setupConstraints() {
        // pin image view
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.rightAnchor.constraint(equalTo: rightAnchor),
            imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.7)
        ])

        // pin detail stack view
        NSLayoutConstraint.activate([
            detailsStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            detailsStackView.leftAnchor.constraint(equalTo: leftAnchor),
            detailsStackView.rightAnchor.constraint(equalTo: rightAnchor),
            detailsStackView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            stepsStackView.topAnchor.constraint(equalTo: detailsStackView.bottomAnchor, constant: 16),
            stepsStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            stepsStackView.rightAnchor.constraint(equalTo: rightAnchor),
            stepsStackView.heightAnchor.constraint(equalToConstant: 90)
        ])

        [servingTimeRow, readyInMinutesRow].forEach { $0.heightAnchor.constraint(equalToConstant: 30).isActive = true }
    }
}
