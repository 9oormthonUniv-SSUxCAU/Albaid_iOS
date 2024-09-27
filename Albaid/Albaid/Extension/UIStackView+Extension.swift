//
//  UIStackView+Extension.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit.UIStackView

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { addArrangedSubview($0) }
    }
}
