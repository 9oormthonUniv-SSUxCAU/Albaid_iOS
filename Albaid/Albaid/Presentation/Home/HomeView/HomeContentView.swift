//
//  HomeContentView.swift
//  Albaid
//
//  Created by 박지윤 on 9/28/24.
//

import UIKit

final class HomeContentView: BaseView {

    // MARK: UI Components
    private(set) var userLabel = UILabel().then {
        $0.text = "김알바님을 위한 알바 내역"
        $0.textColor = .gray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 18)
    }

    private(set) var guideLabel = UILabel().then {
        $0.text = "근로계약서 내용을 토대로 계산했어요"
        $0.textColor = .gray50
        $0.font = UIFont(name: "Pretendard-Regular", size: 13)
    }

    private(set) var monthTotalWageView = UIView().then {
        $0.backgroundColor = .gray100
    }

    private(set) var monthTotalWageImageView = UIImageView().then {
        $0.image = AlbaidButton.payment
    }

    private(set) var monthTotalWageTextLabel = UILabel().then {
        $0.text = "9월 월급 총계"
        $0.textColor = .gray30
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 17)
    }

    private(set) var monthTotalWageLabel = UILabel().then {
        $0.text = "1,054,000원"
        $0.textColor = .gray40
        $0.font = UIFont(name: "Pretendard-Medium", size: 18)
    }

    private(set) var verticalDividerView = UIView().then {
        $0.backgroundColor = .gray70
    }
    
    private(set) var yearTotalView = UIView().then {
        $0.backgroundColor = .gray100
    }

    private(set) var yearTotalWageImageView = UIImageView().then {
        $0.image = AlbaidButton.pig
    }

    private(set) var yearTotalWageTextLabel = UILabel().then {
        $0.text = "올해 총 수입"
        $0.textColor = .gray50
        $0.font = UIFont(name: "Pretendard-Medium", size: 14)
    }

    private(set) var yearTotalWageLabel = UILabel().then {
        $0.text = "20,054,000원"
        $0.textColor = .gray30
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 17)
    }

    private(set) var yearTotalTaxImageView = UIImageView().then {
        $0.image = AlbaidButton.tax
    }

    private(set) var yearTotalTaxTextLabel = UILabel().then {
        $0.text = "올해 낸 세금"
        $0.textColor = .gray50
        $0.font = UIFont(name: "Pretendard-Medium", size: 14)
    }

    private(set) var yearTotalTaxLabel = UILabel().then {
        $0.text = "154,000원"
        $0.textColor = .gray30
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 17)
    }


    // MARK: Configuration
    override func configureSubviews() {
        addSubview(userLabel)
        addSubview(guideLabel)

        addSubview(monthTotalWageView)
        monthTotalWageView.addSubview(monthTotalWageImageView)
        monthTotalWageView.addSubview(monthTotalWageTextLabel)
        monthTotalWageView.addSubview(monthTotalWageLabel)

        addSubview(yearTotalView)
        yearTotalView.addSubview(yearTotalWageImageView)
        yearTotalView.addSubview(yearTotalWageTextLabel)
        yearTotalView.addSubview(yearTotalWageLabel)

        yearTotalView.addSubview(verticalDividerView)

        yearTotalView.addSubview(yearTotalTaxImageView)
        yearTotalView.addSubview(yearTotalTaxTextLabel)
        yearTotalView.addSubview(yearTotalTaxLabel)

        setViewLayer()
//        backgroundColor = .gray95

        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }

    // MARK: Layout
    override func makeConstraints() {
        userLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(26)
            $0.leading.equalToSuperview()
        }

        guideLabel.snp.makeConstraints {
            $0.top.equalTo(userLabel.snp.bottom).offset(3)
            $0.leading.equalToSuperview()
        }

        monthTotalWageView.snp.makeConstraints {
            $0.top.equalTo(guideLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(82)
        }

        monthTotalWageImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.height.width.equalTo(42)
        }

        monthTotalWageTextLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(monthTotalWageImageView.snp.trailing).offset(10)
        }

        monthTotalWageLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
        }

        yearTotalView.snp.makeConstraints {
            $0.top.equalTo(monthTotalWageView.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(126)
        }

        yearTotalWageImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.leading.equalToSuperview().inset(20)
            $0.height.width.equalTo(44)
        }

        yearTotalWageTextLabel.snp.makeConstraints {
            $0.top.equalTo(yearTotalWageImageView.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(20)
        }

        yearTotalWageLabel.snp.makeConstraints {
            $0.top.equalTo(yearTotalWageTextLabel.snp.bottom).offset(3)
            $0.leading.equalToSuperview().inset(20)
        }

        verticalDividerView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(1)
            $0.verticalEdges.equalToSuperview().inset(15)
        }

        yearTotalTaxImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.leading.equalTo(verticalDividerView.snp.trailing).offset(20)
        }

        yearTotalTaxTextLabel.snp.makeConstraints {
            $0.top.equalTo(yearTotalTaxImageView.snp.bottom).offset(5)
            $0.leading.equalTo(verticalDividerView.snp.trailing).offset(20)
        }

        yearTotalTaxLabel.snp.makeConstraints {
            $0.top.equalTo(yearTotalTaxTextLabel.snp.bottom).offset(3)
            $0.leading.equalTo(verticalDividerView.snp.trailing).offset(20)
        }
    }

    private func setViewLayer() {
        monthTotalWageView.layer.cornerRadius = 12
        yearTotalView.layer.cornerRadius = 12
    }
}
