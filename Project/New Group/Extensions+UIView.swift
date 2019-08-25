//
//  Extensions+UIView.swift
//  NetguruCollegeApp
//

import UIKit
import NVActivityIndicatorView

extension UIView {

    private var blurViewTag: Int {
        return 111
    }

    /// Show spinner loader.
    ///
    /// - Parameters:
    ///   - style: Blur style.
    internal func setBlurLoader(style: UIBlurEffect.Style = .dark) {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.tag = blurViewTag

        let activityIndicatorView = NVActivityIndicatorView(
            frame: .zero,
            type: .circleStrokeSpin,
            color: .white,
            padding: nil
        )
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.contentView.addSubview(activityIndicatorView)
        activityIndicatorView.centerXAnchor.constraint(equalTo: blurEffectView.contentView.centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: blurEffectView.contentView.centerYAnchor).isActive = true
        activityIndicatorView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        activityIndicatorView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        addSubview(blurEffectView)

        blurEffectView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        blurEffectView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        blurEffectView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
        blurEffectView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true

        activityIndicatorView.startAnimating()
    }

    internal func removeBlurLoader() {
        guard
            let blurLoader = viewWithTag(blurViewTag),
            contains(blurLoader)
        else {
            return
        }
        blurLoader.removeFromSuperview()

    }
}
