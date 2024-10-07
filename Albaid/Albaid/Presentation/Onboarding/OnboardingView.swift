//
//  OnboardingView.swift
//  Albaid
//
//  Created by 박지윤 on 10/4/24.
//

import UIKit

final class OnboardingView: BaseView {

    // MARK: UI Components
    private(set) var progressImageView = UIImageView().then {
        $0.image = AlbaidImage.progress1
    }

    private(set) var titleLabel = UILabel().then {
        $0.text = AlbaidString.onboardingTitle1
        $0.textColor = .albaidGray10
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 24)
    }

    private(set) var contentLabel = UILabel().then {
        $0.text = AlbaidString.onboardingContent1
        $0.textColor = .albaidGray40
        $0.textAlignment = .center
        $0.numberOfLines = 2
        $0.font = UIFont(name: "Pretendard-Regular", size: 15)
    }

    private(set) var characterImageView = UIImageView().then {
        $0.image = AlbaidImage.onboarding1
        $0.contentMode = .scaleAspectFit
    }

    private(set) var skipButton = BaseButton().then {
        $0.setTitle("건너뛰기", for: .normal)
        $0.setTitleColor(.albaidGray50, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Regular", size: 14)
        $0.setUnderline()
    }

    private(set) var nextButton = BaseButton().then {
        $0.setTextButton(title: "다음", titleColor: .albaidGray100, backgroundColor: .albaidGray20)
    }

    // MARK: Properties
    var tapSkip: (() -> Void)?
    var tapNext: ((Int) -> Void)?

    // MARK: Configuration
    override func configureSubviews() {
        addButtonEvent()

        addSubview(progressImageView)
        addSubview(titleLabel)
        addSubview(contentLabel)
        addSubview(characterImageView)
        addSubview(skipButton)
        addSubview(nextButton)
    }

    // MARK: Layout
    override func makeConstraints() {
        progressImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(3)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(progressImageView.snp.bottom).offset(70)
            $0.centerX.equalToSuperview()
        }

        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }

        characterImageView.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(85)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(260)
        }

        skipButton.snp.makeConstraints {
            $0.bottom.equalTo(nextButton.snp.top).offset(-15)
            $0.centerX.equalToSuperview()
        }

        nextButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(45)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }

    // MARK: Event
    private func addButtonEvent() {
        skipButton.addTarget(self, action: #selector(handleSkipButton), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(handleNextButton), for: .touchUpInside)
    }

    @objc
    private func handleSkipButton() {
        tapSkip?()
    }

    @objc
    private func handleNextButton() {
        switch progressImageView.image {
        case AlbaidImage.progress1:
            tapNext?(1)
        case AlbaidImage.progress2:
            tapNext?(2)
        case AlbaidImage.progress3:
            tapNext?(3)
        case .none:
            break
        case .some(_):
            break
        }
    }
}
