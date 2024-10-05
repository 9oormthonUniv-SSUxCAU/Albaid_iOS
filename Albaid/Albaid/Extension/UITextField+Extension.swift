//
//  UITextField+Extension.swift
//  Albaid
//
//  Created by 박지윤 on 10/5/24.
//

import UIKit.UITextField

extension UITextField {
    func setContractText(content: String) {
        text = content
        textColor = .albaidGray20
        font = UIFont(name: "Pretendard-SemiBold", size: 16)
    }

    func setContractPlaceholder(content: String) {
        let placeholderText = content
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.albaidGray60,
            .font: UIFont(name: "Pretendard-SemiBold", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .semibold)
        ]

        attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
    }
}
