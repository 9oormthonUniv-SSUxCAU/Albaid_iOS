//
//  CardGuideOptionModalView.swift
//  Albaid
//
//  Created by 박지윤 on 9/30/24.
//

import UIKit

final class CardGuideOptionModalView: BaseView {
    
    // MARK: UI Components
    private(set) var modalDividerView = UIView().then {
        $0.backgroundColor = .albaidGray70
        $0.layer.cornerRadius = 3
    }

    private(set) var optionTitleLabel = UILabel().then {
        $0.text = "월급 총계"
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 20)
    }

    private(set) var optionContentLabel = UILabel().then {
        $0.text = "등록된 알바 카드의 이번 달 월급을 모두 더한 금액이에요"
        $0.textColor = .albaidGray50
        $0.font = UIFont(name: "Pretendard-Regular", size: 15)
    }

    private(set) var confirmButton = BaseButton().then {
        $0.setTextButton(title: "확인", titleColor: .albaidGray60, backgroundColor: .albaidGray100)
        $0.setBorder70()
    }

    // MARK: Properties
    var tapConfirm: (() -> Void)?

    // MARK: Configuration
    override func configureSubviews() {
        addButtonEvent()

        addSubview(modalDividerView)
        addSubview(optionTitleLabel)
        addSubview(optionContentLabel)
        addSubview(confirmButton)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        modalDividerView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(38)
            $0.height.equalTo(6)
        }
    
        optionTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(28)
            $0.horizontalEdges.equalToSuperview().inset(25)
        }

        optionContentLabel.snp.makeConstraints {
            $0.top.equalTo(optionTitleLabel.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(25)
        }

        confirmButton.snp.makeConstraints {
            $0.top.equalTo(optionContentLabel.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(56)
        }
    }

    // MARK: Event
    private func addButtonEvent() {
        confirmButton.addTarget(self, action: #selector(handleConfirmButton), for: .touchUpInside)
    }

    @objc
    private func handleConfirmButton() {
        tapConfirm?()
    }
}
