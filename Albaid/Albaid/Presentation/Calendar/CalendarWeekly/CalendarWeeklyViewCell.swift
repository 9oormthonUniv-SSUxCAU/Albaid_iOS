//
//  CalendarWeeklyViewCell.swift
//  Albaid
//
//  Created by 박지윤 on 10/4/24.
//

import UIKit

final class CalendarWeeklyViewCell: UICollectionViewCell {

    static let identifier = "CalendarWeeklyViewCell"

    // MARK: UI Components
    private(set) var dayTextLabel = UILabel().then {
        $0.text = "일"
        $0.textColor = .albaidGray50
        $0.font = UIFont(name: "Pretendard-Medium", size: 14)
    }

    private(set) var dayLabel = UILabel().then {
        $0.text = "22"
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 18)
    }

    private(set) var cardView = UIView().then {
        $0.backgroundColor = .albaidMainGreen
        $0.layer.cornerRadius = 12
    }

    private(set) var labelStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 5
    }

    private(set) var titleLabel = UILabel().then {
        $0.text = "알바 카드1"
        $0.textColor = .albaidGray100
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 16)
    }

    private(set) var timeLabel = UILabel().then {
        $0.text = "10:00 - 14:00"
        $0.textColor = .albaidGray100
        $0.font = UIFont(name: "Pretendard-Regular", size: 12)
    }

    private(set) var detailButton = BaseButton().then {
        $0.setImage(AlbaidButton.detail.withTintColor(.albaidGray100), for: .normal)
    }

    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureSubviews()
        makeConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Configuration
    private func configureSubviews() {
        contentView.addSubview(dayTextLabel)
        contentView.addSubview(dayLabel)
        contentView.addSubview(cardView)
        cardView.addSubview(labelStackView)
        labelStackView.addArrangedSubviews(titleLabel, timeLabel)
        cardView.addSubview(detailButton)
    }

    // MARK: Layout
    private func makeConstraints() {
        dayTextLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }

        dayLabel.snp.makeConstraints {
            $0.top.equalTo(dayTextLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview()
            $0.width.equalTo(30)
        }

        cardView.snp.makeConstraints {
            $0.trailing.centerY.height.equalToSuperview()
            $0.leading.equalTo(dayLabel.snp.trailing).offset(20)
        }

        labelStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }

        detailButton.snp.makeConstraints {
            $0.trailing.centerY.equalToSuperview()
            $0.height.width.equalTo(24)
        }
    }

    func setData(data: Card?) {
    }
}

