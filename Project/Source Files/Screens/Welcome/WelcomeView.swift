//
//  WelcomeView.swift
//  NetguruCollegeApp
//

import UIKit

final class WelcomeView: UIView {

    class func instanceFromNib() -> UIView {
        return UINib(nibName: "WelcomeView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
