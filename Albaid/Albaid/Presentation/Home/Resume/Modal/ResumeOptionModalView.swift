//
//  ResumeOptionModalView.swift
//  Albaid
//
//  Created by 박지윤 on 9/30/24.
//

import UIKit

final class ResumeOptionModalView: BaseView {
    
    // MARK: UI Components
    private(set) var modalDividerView = UIView().then {
        $0.backgroundColor = .albaidGray70
        $0.layer.cornerRadius = 3
    }

    private(set) var optionTitleLabel = UILabel().then {
        $0.text = "더 보기"
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 20)
    }

    private(set) var dividerView = UIView().then {
        $0.backgroundColor = .albaidGray70
    }

    private(set) var shareButton = BaseButton().then {
        $0.setOptionButton(optionImage: AlbaidButton.share.withTintColor(.albaidGray40), title: "공유하기")
    }

    private(set) var editButton = BaseButton().then {
        $0.setOptionButton(optionImage: AlbaidButton.edit.withTintColor(.albaidGray40), title: "수정하기")
    }

    private(set) var deleteButton = BaseButton().then {
        $0.setOptionButton(optionImage: AlbaidButton.delete.withTintColor(.albaidGray40), title: "삭제하기")
    }

    // MARK: Properties

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(modalDividerView)
        addSubview(optionTitleLabel)
        addSubview(dividerView)
        addSubview(shareButton)
        addSubview(editButton)
        addSubview(deleteButton)
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
            $0.horizontalEdges.equalToSuperview().inset(20)
        }

        dividerView.snp.makeConstraints {
            $0.top.equalTo(optionTitleLabel.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(1)
        }

        shareButton.snp.makeConstraints {
            $0.top.equalTo(dividerView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }

        editButton.snp.makeConstraints {
            $0.top.equalTo(shareButton.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }

        deleteButton.snp.makeConstraints {
            $0.top.equalTo(editButton.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }
}
