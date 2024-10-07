//
//  DeletePopUpView.swift
//  Albaid
//
//  Created by 박지윤 on 10/8/24.
//

import UIKit

final class DeletePopUpView: BaseView {
    
    // MARK: UI Components
    private let contentView = UIView().then {
        $0.backgroundColor = .albaidGray100
        $0.layer.cornerRadius = 12
    }

    private(set) var titleLabel = UILabel().then {
        $0.text = "근로계약서를 삭제하시겠습니까?"
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 22)
    }

    private(set) var contentLabel = UILabel().then {
        $0.text = "영구적으로 삭제되며 복구할 수 없습니다."
        $0.textColor = .albaidGray50
        $0.font = UIFont(name: "Pretendard-Medium", size: 16)
    }

    private(set) var buttonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 16
        $0.distribution = .fillEqually
    }

    private(set) var cancelButton = BaseButton().then {
        $0.setPopUpButton(title: "취소", titleColor: .albaidGray40, backgroundColor: .albaidGray90)
    }

    private(set) var deleteButton = BaseButton().then {
        $0.setPopUpButton(title: "삭제하기", titleColor: .albaidGray100, backgroundColor: .albaidGray20)
    }

    // MARK: Properties
    var tapCancel: (() -> Void)?
    var tapDelete: (() -> Void)?

    // MARK: Configuration
    override func configureSubviews() {
        addButtonEvent()
        backgroundColor = .black.withAlphaComponent(0.3)

        addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentLabel)
        contentView.addSubview(buttonStackView)

        buttonStackView.addArrangedSubviews(cancelButton,
                                            deleteButton)
    }

    // MARK: Layout
    override func makeConstraints() {
        contentView.snp.makeConstraints {
            $0.height.equalTo(184)
            $0.width.equalTo(346)
            $0.center.equalToSuperview()
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(25)
            $0.centerX.equalToSuperview()
        }
    
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
        }

        buttonStackView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(20)
            $0.width.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(50)
        }
    }

    private func addButtonEvent() {
        cancelButton.addTarget(self, action: #selector(handleCancelButton), for: .touchUpInside)
        deleteButton.addTarget(self, action: #selector(handleDeleteButton), for: .touchUpInside)
    }

    @objc
    private func handleCancelButton() {
        tapCancel?()
    }

    @objc
    private func handleDeleteButton() {
        tapDelete?()
    }
}
