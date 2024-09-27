//
//  UIButton+Extension.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit.UIButton

extension UIButton {
    func setLoginButton(image: UIImage, title: String, titleColor: UIColor, backgroundColor: UIColor) {
        setDefaultButton()

        setImage(image, for: .normal)
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        imageEdgeInsets = .init(top: 0, left: -15, bottom: 0, right: 0)
    }

    func setDefaultButton() {
        layer.cornerRadius = 12
        snp.makeConstraints {
            $0.height.equalTo(54)
        }
        titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 16.0)
    }
}
