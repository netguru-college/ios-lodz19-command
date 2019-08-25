//
//  DetailInformationView.swift
//  NetguruCollegeApp
//
import Foundation
import UIKit

class DetailInformationView: UIView {
    private let imageLabel: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = #colorLiteral(red: 0.9369841218, green: 0.3454609811, blue: 0.1157674268, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    func feedWithValueString(valueString: String) {
        valueLabel.text = valueString
    }

    init(iconName: String) {
        super.init(frame: .zero)
        imageLabel.image = UIImage(named: iconName)
        imageLabel.backgroundColor = #colorLiteral(red: 0.9369841218, green: 0.3454609811, blue: 0.1157674268, alpha: 1)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {
        addSubview(imageLabel)
        addSubview(valueLabel)

        NSLayoutConstraint.activate([
            imageLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            imageLabel.topAnchor.constraint(equalTo: self.topAnchor),
            imageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            valueLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            valueLabel.topAnchor.constraint(equalTo: self.topAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageLabel.rightAnchor.constraint(equalTo: valueLabel.leftAnchor)
//
//                imageLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
//                imageLabel.topAnchor.constraint(equalTo: self.topAnchor),
//                imageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//                imageLabel.heightAnchor.constraint(equalToConstant: 5),
//                valueLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
//                valueLabel.topAnchor.constraint(equalTo: self.topAnchor),
//                valueLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//                imageLabel.rightAnchor.constraint(equalTo: valueLabel.leftAnchor)
        ])
    }
}
