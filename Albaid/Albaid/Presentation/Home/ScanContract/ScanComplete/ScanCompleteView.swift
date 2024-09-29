//
//  ScanCompleteView.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class ScanCompleteView: BaseView {
    
    // MARK: UI Components
    private(set) var completeImageView = UIImageView().then {
        $0.image = AlbaidImage.complete
        $0.contentMode = .scaleAspectFit
    }

    private(set) var completeLabel = UILabel().then {
        $0.text = "근로계약서 등록 완료!"
        $0.textColor = .gray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 28)
    }

    private(set) var completeGuideLabel = UILabel().then {
        $0.text = AlbaidString.completeGuide
        $0.textColor = .gray50
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.font = UIFont(name: "Pretendard-Regular", size: 15)
    }

    private(set) var memoButton = BaseButton().then {
        $0.setMemoButton(content: "메모 남기기")
        $0.setImage(AlbaidImage.memo, for: .normal)
        $0.backgroundColor = .gray95
    }

    private(set) var confirmButton = BaseButton().then {
        $0.setTextButton(title: "확인", titleColor: .white, backgroundColor: .gray20 ?? .white)
    }

    // MARK: Properties
    var tapMemo: (() -> Void)?
    var tapConfirm: (() -> Void)?

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(completeImageView)
        addSubview(completeLabel)
        addSubview(completeGuideLabel)
        addSubview(memoButton)
        addSubview(confirmButton)

        addButtonEvent()
    }
    
    // MARK: Layout
    override func makeConstraints() {
        completeImageView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(202)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(74)
        }

        completeLabel.snp.makeConstraints {
            $0.top.equalTo(completeImageView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }

        completeGuideLabel.snp.makeConstraints {
            $0.top.equalTo(completeLabel.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
        }

        memoButton.snp.makeConstraints {
            $0.top.equalTo(completeGuideLabel.snp.bottom).offset(25)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(107)
            $0.height.equalTo(34)
        }

        confirmButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(45)
            $0.width.equalToSuperview()
        }
    }

    // MARK: Event
    private func addButtonEvent() {
        memoButton.addTarget(self, action: #selector(handleMemoButton), for: .touchUpInside)
        confirmButton.addTarget(self, action: #selector(handleConfirmButton), for: .touchUpInside)
    }

    @objc
    private func handleMemoButton() {
        tapMemo?()
    }

    @objc
    private func handleConfirmButton() {
        tapConfirm?()
    }
}
