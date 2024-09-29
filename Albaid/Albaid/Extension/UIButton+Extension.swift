//
//  UIButton+Extension.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit.UIButton

extension UIButton {
    func setLoginButton(image: UIImage, title: String, titleColor: UIColor, backgroundColor: UIColor) {
        layer.cornerRadius = 12
        snp.makeConstraints {
            $0.height.equalTo(54)
        }

        var attributedTitle = AttributedString(title)
        attributedTitle.font = UIFont(name: "Pretendard-SemiBold", size: 15)
        attributedTitle.foregroundColor = titleColor

        var configuration = UIButton.Configuration.plain()
        configuration.attributedTitle = attributedTitle
        configuration.image = image
        configuration.imagePadding = 15
        configuration.imagePlacement = .leading
        self.configuration = configuration
        self.backgroundColor = backgroundColor
    }

    func setTextButton(title: String, titleColor: UIColor, backgroundColor: UIColor) {
        layer.cornerRadius = 12
        snp.makeConstraints {
            $0.height.equalTo(56)
        }

        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 16)
        self.backgroundColor = backgroundColor
    }

    func setMenuButton(image: UIImage, title: String) {
        var attributedTitle = AttributedString(title)
        attributedTitle.font = UIFont(name: "Pretendard-SemiBold", size: 15)
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

    func setContractButton(content: String) {
        setTitle(content, for: .normal)
        setTitleColor(.gray60, for: .normal)
        titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 16)
    }

    func setMemoButton(content: String) {
        var attributedTitle = AttributedString(content)
        attributedTitle.font = UIFont(name: "Pretendard-Medium", size: 14)
        attributedTitle.foregroundColor = .gray40

        var configuration = UIButton.Configuration.plain()
        configuration.attributedTitle = attributedTitle
        configuration.image = AlbaidImage.memo
        configuration.imagePadding = 5
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10)
        configuration.imagePlacement = .leading
        self.configuration = configuration
        backgroundColor = .gray95
        layer.cornerRadius = 6
    }

    func setBorder() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray80?.cgColor
    }
}
