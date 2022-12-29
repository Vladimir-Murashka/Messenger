//
//  UIStackView.swift
//  Messenger
//
//  Created by Swift Learning on 29.12.2022.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach {
            addArrangedSubview($0)
        }
    }
}

