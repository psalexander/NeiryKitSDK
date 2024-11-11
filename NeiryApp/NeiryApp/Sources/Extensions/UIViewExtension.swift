//
//  UIViewExtension.swift
//
//  Created by Александр on 26.07.2022.
//

import UIKit

extension UIView {
    func bindToSuperviewBounds(insets: UIEdgeInsets = .zero) {
        guard let superview = self.superview else {
            print("Error: Trying to add constraints without superview")
            return
        }
        translatesAutoresizingMaskIntoConstraints = false

        let leftConstraint = leftAnchor.constraint(equalTo: superview.leftAnchor, constant: insets.left)
        let rightConstraint = rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -insets.right)
        let topConstraint = topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top)
        let bottomConstraint = bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -insets.bottom)
        NSLayoutConstraint.activate([leftConstraint, rightConstraint, topConstraint, bottomConstraint])
        layoutIfNeeded()
    }
}

extension UIView {

    func applyGradient(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil)
    }


    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
}

