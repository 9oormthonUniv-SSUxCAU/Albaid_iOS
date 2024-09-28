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
        
        var attributedTitle = AttributedString(title)
        attributedTitle.font = UIFont(name: "Pretendard-SemiBold", size: 15.0)
        attributedTitle.foregroundColor = titleColor

        var configuration = UIButton.Configuration.plain()
        configuration.attributedTitle = attributedTitle
        configuration.image = image
        configuration.imagePadding = 15
        configuration.imagePlacement = .leading
        self.configuration = configuration
        self.backgroundColor = backgroundColor
    }

    func setDefaultButton() {
        layer.cornerRadius = 12
        snp.makeConstraints {
            $0.height.equalTo(54)
        }
        titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 16.0)
    }

    func setMenuButton(image: UIImage, title: String) {
        var attributedTitle = AttributedString(title)
        attributedTitle.font = UIFont(name: "Pretendard-SemiBold", size: 15.0)
        attributedTitle.foregroundColor = .gray30

        var configuration = UIButton.Configuration.plain()
        configuration.attributedTitle = attributedTitle
        configuration.image = image
        configuration.imagePadding = 12
        configuration.imagePlacement = .top
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        self.configuration = configuration

        snp.makeConstraints {
            $0.height.width.equalTo(70)
        }
    }

    func setBorder() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray80?.cgColor
    }
}
