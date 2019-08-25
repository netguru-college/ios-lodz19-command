//
//  WelcomeView.swift
//  NetguruCollegeApp
//

import UIKit

final class WelcomeView: UIView {

    @IBOutlet var randomButton: UIButton!
    @IBOutlet var cusineLabel: UILabel!
    @IBOutlet var nextScreenButton: UIButton!

    class func instanceFromNib() -> UIView {
        let view = UINib(
            nibName: "WelcomeView",
            bundle: nil
        ).instantiate(withOwner: nil, options: nil)[0] as! WelcomeView
        view.setupLayout()
        return view
    }

    func setupLayout() {
        randomButton.layer.cornerRadius = randomButton.frame.height / 2
        nextScreenButton.isHidden = true
    }

}
