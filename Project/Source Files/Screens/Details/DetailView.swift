//
//  DetailView.swift
//  NetguruCollegeApp
//

import UIKit

final class DetailView: UIView {

    class func instanceFromNib() -> UIView {
        return UINib(nibName: "DetailView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
