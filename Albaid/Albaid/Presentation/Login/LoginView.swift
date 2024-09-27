//
//  LoginView.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class LoginView: BaseView {
    
    // MARK: UI Components
    private let logoImageView = UIImageView().then {
        $0.image = AlbaidImage.loginLogo
        $0.contentMode = .scaleAspectFit
    }

    private let logoLabel = UILabel().then {
        $0.text = "나한테 맞춘 가장 쉬운 알바 관리"
        $0.textColor = .mainGreen
        $0.font = UIFont(name: "Pretendard-Medium", size: 18)
    }

    private let loginButtonStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 15
    }

    private let naverLoginButton = BaseButton().then {
        $0.setLoginButton(image: AlbaidButton.naver, title: "네이버 로그인", titleColor: .white, backgroundColor: .naver ?? .green)
    }

    private let kakaoLoginButton = BaseButton().then {
        $0.setLoginButton(image: AlbaidButton.kakao, title: "카카오 로그인", titleColor: .gray30 ?? .black, backgroundColor: .kakao ?? .yellow)
    }

    private let googleLoginButton = BaseButton().then {
        $0.setLoginButton(image: AlbaidButton.google, title: "구글 로그인", titleColor: .gray10 ?? .black, backgroundColor: .white)
    }

    private let appleLoginButton = BaseButton().then {
        $0.setLoginButton(image: AlbaidButton.apple, title: "애플 로그인", titleColor: .white, backgroundColor: .black)
    }

    // MARK: Properties

    // MARK: Configuration
    override func configureSubviews() {
        
        addSubview(logoImageView)
        addSubview(logoLabel)
        addSubview(loginButtonStackView)

        loginButtonStackView.addArrangedSubviews(naverLoginButton,
                                                 kakaoLoginButton,
                                                 googleLoginButton,
                                                 appleLoginButton)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(110)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(36)
        }

        logoLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
        }

        loginButtonStackView.snp.makeConstraints {
            $0.top.equalTo(logoLabel.snp.bottom).offset(219)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
        }
    }
    
    // MARK: Event
}
