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
        textAlignment = .right

        attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
    }
    
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    
    func customPlaceholder() {
        guard let string = self.placeholder else {
            return
        }
        attributedPlaceholder = NSAttributedString(string: string,
                                                   attributes: [.foregroundColor: UIColor.albaidGray60,
                                                                .font: UIFont(name: "Pretendard-Medium", size: 15) as Any])
    }
}
