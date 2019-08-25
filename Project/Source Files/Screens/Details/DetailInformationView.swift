//
//  DetailInformationView.swift
//  NetguruCollegeApp
//
import Foundation
import UIKit

class DetailInformationView : UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    func feedWithValueString(valueString: String) {
        valueLabel.text = valueString
    }

    init(titleString: String) {
        super.init(frame: .zero)
        titleLabel.text = titleString

        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {
        addSubview(titleLabel)
        addSubview(valueLabel)

        NSLayoutConstraint.activate([
                    titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
                    titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
                    titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                    valueLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
                    valueLabel.topAnchor.constraint(equalTo: self.topAnchor),
                    valueLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                    titleLabel.rightAnchor.constraint(equalTo: valueLabel.leftAnchor)
            ])
    }
}
