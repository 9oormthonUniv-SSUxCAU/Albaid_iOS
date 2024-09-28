//
//  UILabel+Extension.swift
//  Albaid
//
//  Created by 박지윤 on 9/29/24.
//

import UIKit.UILabel

extension UILabel {
    func setLineSpacing(lineSpacing: CGFloat) {
        guard let labelText = self.text else { return }

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing

        let attributedString: NSMutableAttributedString
        if let currentAttributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: currentAttributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }

        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))

        self.attributedText = attributedString
    }
}
