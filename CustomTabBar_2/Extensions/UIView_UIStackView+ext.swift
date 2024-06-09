//
//  UIView_UIStackView+ext.swift
//  CustomTabBar_2
//
//  Created by Ravshan Winter on 09/06/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { subview in
            subview.translatesAutoresizingMaskIntoConstraints = false
            addSubview(subview)
        }
    }
}

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { arrangedSubview in
            arrangedSubview.translatesAutoresizingMaskIntoConstraints = false
            addArrangedSubview(arrangedSubview)
        }
    }
}
