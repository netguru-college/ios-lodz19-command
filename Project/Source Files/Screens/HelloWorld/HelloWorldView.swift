//
//  HelloWorldView.swift
//  NetguruCollegeApp
//

import UIKit

final class HelloWorldView: UIView {

    @IBOutlet weak var nextButton: UIButton!

    @IBOutlet var showDetailViewButton: UIButton!
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "HelloWorldView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
