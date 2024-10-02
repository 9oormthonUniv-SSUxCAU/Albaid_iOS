//
//  CardContentView.swift
//  Albaid
//
//  Created by 박지윤 on 9/30/24.
//

import UIKit

final class CardContentView: BaseView {

    // MARK: UI Components
    private let titleLabel = UILabel().then {
        $0.text = "알바 카드1"
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 24)
    }

    private let categoryLabel = UILabel().then {
        $0.text = "카페 아르바이트"
        $0.textColor = .albaidGray60
        $0.font = UIFont(name: "Pretendard-Medium", size: 16)
    }

    private let contractButton = BaseButton().then {
        $0.setImage(AlbaidButton.file, for: .normal)
    }

    private let cardContentDetailView = CardContentDetailView()

    private(set) var memoLabel = UILabel().then {
        $0.text = "메모"
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 18)
    }

    private(set) var memoTextView = UITextView().then {
        $0.text = "텍스트를 작성하면 이렇게 보입니다."
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 15)
        $0.backgroundColor = .albaidGray95
        $0.layer.cornerRadius = 12
        $0.contentInset = UIEdgeInsets(top: 12, left: 20, bottom: 12, right: 20)
    }

    // MARK: Properties
    var tapContract: (() -> Void)?

    // MARK: Configuration
    override func configureSubviews() {
        setLayer()
        addButtonEvent()

        addSubview(titleLabel)
        addSubview(categoryLabel)
        addSubview(contractButton)
        addSubview(cardContentDetailView)
        addSubview(memoLabel)
        addSubview(memoTextView)
    }

    // MARK: Layout
    override func makeConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.leading.equalToSuperview().inset(20)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(20)
        }

        contractButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(38)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.width.equalTo(44)
        }

        cardContentDetailView.snp.makeConstraints {
            $0.top.equalTo(categoryLabel.snp.bottom).offset(25)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(494)
        }

        memoLabel.snp.makeConstraints {
            $0.top.equalTo(cardContentDetailView.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(20)
        }

        memoTextView.snp.makeConstraints {
            $0.top.equalTo(memoLabel.snp.bottom).offset(10)
            $0.height.equalTo(97)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(30)
        }
    }

    private func setLayer() {
        layer.cornerRadius = 20
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        backgroundColor = .albaidGray100
    }

    // MARK: Event
    private func addButtonEvent() {
        contractButton.addTarget(self, action: #selector(handleContractButton), for: .touchUpInside)
    }

    @objc
    private func handleContractButton() {
        tapContract?()
    }
}
