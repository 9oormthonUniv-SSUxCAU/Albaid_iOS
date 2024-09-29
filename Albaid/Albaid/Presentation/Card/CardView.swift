//
//  CardView.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class CardView: BaseView {

    // MARK: UI Components
    private let paymentImageView = UIImageView().then {
        $0.image = AlbaidImage.payment
    }

    private let monthLabel = UILabel().then {
        $0.text = "9월 월급 총계"
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 18)
    }

    private let guideButton = BaseButton().then {
        $0.setImage(AlbaidButton.guide, for: .normal)
    }

    private let userWageLabel = UILabel().then {
        $0.text = "김알바님의 이번 달 월급"
        $0.textColor = .albaidGray50
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
    }

    private let wageLabel = UILabel().then {
        $0.text = "1,054,000원"
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 30)
    }

    private let dividerView = DividerView(dividerType: .thick)

    private let cardCollectionView = CardCollectionView()

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(paymentImageView)
        addSubview(monthLabel)
        addSubview(guideButton)
        addSubview(userWageLabel)
        addSubview(wageLabel)
        addSubview(dividerView)
        addSubview(cardCollectionView)
    }

    // MARK: Layout
    override func makeConstraints() {
        paymentImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(141)
            $0.height.width.equalTo(42)
        }

        monthLabel.snp.makeConstraints {
            $0.leading.equalTo(paymentImageView.snp.trailing).offset(10)
            $0.centerY.equalTo(paymentImageView)
        }

        guideButton.snp.makeConstraints {
            $0.leading.equalTo(monthLabel.snp.trailing).offset(5)
            $0.centerY.equalTo(paymentImageView)
            $0.height.width.equalTo(24)
        }

        userWageLabel.snp.makeConstraints {
            $0.top.equalTo(paymentImageView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
        }

        wageLabel.snp.makeConstraints {
            $0.top.equalTo(userWageLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(20)
        }

        dividerView.snp.makeConstraints {
            $0.top.equalTo(wageLabel.snp.bottom).offset(25)
            $0.horizontalEdges.equalToSuperview()
        }

        cardCollectionView.snp.makeConstraints {
            $0.top.equalTo(dividerView.snp.bottom).offset(8)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
