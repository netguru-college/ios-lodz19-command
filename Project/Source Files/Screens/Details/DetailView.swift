//
//  DetailView.swift
//  NetguruCollegeApp
//

import UIKit

//TODO: extract subview to separate class
final class DetailView: UIView {
    // MARK: properties
    private var meal: Meal?
    private var imageView: UIImageView?

    private let detailsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()

    // MARK: initializers
    init(meal: Meal) {
        super.init(frame: .zero)
        self.meal = meal

        initializeViews()
        addSubviews()
        setupConstraints()
        setupProperties()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func addSubviews() {
        addSubview(imageView!)
        setupDetailsStackView()
        addSubview(detailsStackView)
    }

    private func initializeViews() {
        let imageView: UIImage! = UIImage(named: meal?.image ?? "image2.jpeg")
        self.imageView = {
            let imageView = UIImageView(image: imageView)
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
    }

    private func setupConstraints() {
        setupImageViewConstraints()
        setupStackViewConstraints()
    }

    // MARK: Constraints setters for necessary views
    private func setupImageViewConstraints() {
        NSLayoutConstraint.activate([
            imageView!.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            imageView!.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView!.heightAnchor.constraint(equalToConstant: 100)
            ])

    }

    private func setupStackViewConstraints() {
       NSLayoutConstraint.activate([
            
        ])
    }


    // adds necessary rows for detail stack view
    private func setupDetailsStackView() {
        if let meal = self.meal {
            let servingStackView = detailStackViewRowFactory(labelText: "Serving time:", labelValue: "\(meal.serving)")
            let readyInMinutesStackView = detailStackViewRowFactory(labelText: "Ready in minutes:", labelValue: "\(meal.serving)")

            detailsStackView.addSubview(servingStackView)
            detailsStackView.addSubview(readyInMinutesStackView)
        }
    }

    // initializes global view properties e.g background color
    private func setupProperties() {
        backgroundColor = .lightGray
    }

    // factory method returning single view nested in meal detail stackview
    private func detailStackViewRowFactory(labelText: String, labelValue: String) -> UIStackView {
        let horizontalStackView = UIStackView()
        horizontalStackView.distribution = .fill
        horizontalStackView.axis = .horizontal

        let propertyLabel = UILabel()
        propertyLabel.text = labelText

        let propertyValue = UILabel()
        propertyLabel.text = labelValue

        horizontalStackView.addSubview(propertyLabel)
        horizontalStackView.addSubview(propertyValue)

        return horizontalStackView
    }
}
