//
//  CardCollectionViewHeader.swift
//  Albaid
//
//  Created by 박지윤 on 9/30/24.
//

import UIKit

final class CardCollectionViewHeader: UICollectionReusableView {

    // MARK: Properties
    static let identifier = "CardCollectionViewHeader"

    // MARK: UI Components
    private let paymentImageView = UIImageView().then {
        $0.image = AlbaidImage.payment
    }

    private let monthLabel = UILabel().then {
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 18)
    }

    private let guideButton = BaseButton().then {
        $0.setImage(AlbaidButton.guide, for: .normal)
    }

    private let userWageLabel = UILabel().then {
        $0.textColor = .albaidGray50
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
    }

    private let wageLabel = UILabel().then {
        $0.text = "1,054,000원"
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 30)
    }

    private let dividerView = DividerView(dividerType: .thick)

    // MARK: Properties
    var tapGuide: (() -> Void)?

    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureSubviews()
        makeConstraints()
        addButtonEvent()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Properties

    // MARK: Configuration
    private func configureSubviews() {
        addSubview(paymentImageView)
        addSubview(monthLabel)
        addSubview(guideButton)
        addSubview(userWageLabel)
        addSubview(wageLabel)
        addSubview(dividerView)
    }

    // MARK: Layout
    private func makeConstraints() {
        paymentImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(32.5)
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
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }

    // MARK: Event
    private func addButtonEvent() {
        guideButton.addTarget(self, action: #selector(handleGuideButton), for: .touchUpInside)
    }

    @objc
    private func handleGuideButton() {
        tapGuide?()
    }

    // MARK: Data
    func setData(data: User) {
        let today = Date()
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "M"
        monthFormatter.locale = Locale(identifier: "ko_KR")
        let monthToString = monthFormatter.string(from: today)

        userWageLabel.text = data.name + "님을 위한 알바 내역"
        monthLabel.text = monthToString + "월 월급 총계"
    }
}
