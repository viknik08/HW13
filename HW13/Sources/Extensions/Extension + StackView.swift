//
//  Extension + StackView.swift
//  HW13
//
//  Created by Виктор Басиев on 25.08.2022.
//

import UIKit

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spasing: CGFloat, distribution: UIStackView.Distribution, aligment: Alignment?) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spasing
        self.distribution = distribution
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
