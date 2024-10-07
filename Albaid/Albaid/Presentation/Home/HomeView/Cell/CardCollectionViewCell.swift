//
//  CardCollectionViewCell.swift
//  Albaid
//
//  Created by 박지윤 on 9/28/24.
//

import UIKit

final class CardCollectionViewCell: UICollectionViewCell {

    static let identifier = "CardCollectionViewCell"

    // MARK: UI Components
    private(set) var titleLabel = UILabel().then {
        $0.textColor = .albaidGray100
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 16)
    }

    private(set) var detailButton = UIImageView().then {
        $0.image = AlbaidButton.detail.withTintColor(.albaidGray100)
    }

    private(set) var workplaceLabel = UILabel().then {
        $0.textColor = .albaidGray100
        $0.font = UIFont(name: "Pretendard-Regular", size: 13)
    }

    private(set) var wageTextLabel = UILabel().then {
        $0.text = "이번 달 알바비"
        $0.textColor = .albaidGray100
        $0.font = UIFont(name: "Pretendard-Medium", size: 13)
    }

    private(set) var wageLabel = UILabel().then {
        $0.textColor = .albaidGray100
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 36)
    }

    private(set) var coffeeImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }

    private(set) var addImageView = UIImageView().then {
        $0.image = AlbaidImage.add
    }

    private(set) var addLabel = UILabel().then {
        $0.text = "알바 카드 추가하기"
        $0.textColor = .albaidGray60
        $0.font = UIFont(name: "Pretendard-Medium", size: 16)
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
        contentView.layer.cornerRadius = 16

        addSubview(titleLabel)
        addSubview(detailButton)
        addSubview(workplaceLabel)
        addSubview(wageTextLabel)
        addSubview(wageLabel)
        addSubview(coffeeImageView)
    }

    // MARK: Layout
    private func makeConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.leading.equalToSuperview().inset(20)
        }

        detailButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.leading.equalTo(titleLabel.snp.trailing).offset(5)
            $0.width.height.equalTo(24)
        }

        workplaceLabel.snp.makeConstraints {
            $0.top.equalTo(detailButton.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(20)
        }

        wageTextLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.bottom.equalTo(wageLabel.snp.top).offset(-7)
        }

        wageLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(15)
        }

        coffeeImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(41)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(60)
        }
    }

    func setData(data: Contract) {
        titleLabel.text = data.title
        workplaceLabel.text = data.workplace
        
        // TODO: 월급 계산
        let timeDifferenceInSeconds = data.standardWorkingEndTime.timeIntervalSince(data.standardWorkingStartTime)
        
        let hours = Double(Int(timeDifferenceInSeconds) / 3600)
        var minutes = Double((Int(timeDifferenceInSeconds) % 3600) / 60)
        let weeks = 4.0
        var wage = 0.0

        if minutes == 0 {
            wage = Double(data.workingDays.count) * hours * Double(data.hourlyWage) * weeks
        } else {
            minutes /= 60
            wage = Double(data.workingDays.count) * (hours + minutes) * Double(data.hourlyWage) * weeks
        }

        wageLabel.text = (Int(wage).toPriceFormat) + "원"

        switch (data.id + 1) % 3 {
        case 0:
            contentView.backgroundColor = .albaidSubPink
            coffeeImageView.image = AlbaidImage.coffeePink
        case 1:
            contentView.backgroundColor = .albaidMainGreen
            coffeeImageView.image = AlbaidImage.coffeeGreen
        case 2:
            contentView.backgroundColor = .albaidSubBlue
            coffeeImageView.image = AlbaidImage.coffeeBlue
        default:
            contentView.backgroundColor = .albaidMainGreen
            coffeeImageView.image = AlbaidImage.coffeeGreen
        }
    }

    func setAddCardCell() {
        titleLabel.removeFromSuperview()
        detailButton.removeFromSuperview()
        workplaceLabel.removeFromSuperview()
        wageTextLabel.removeFromSuperview()
        wageLabel.removeFromSuperview()
        coffeeImageView.removeFromSuperview()

        contentView.backgroundColor = .albaidGray95

        contentView.addSubview(addImageView)
        contentView.addSubview(addLabel)

        addImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(46)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(50)
        }

        addLabel.snp.makeConstraints {
            $0.top.equalTo(addImageView.snp.bottom).offset(7)
            $0.centerX.equalToSuperview()
        }
    }
}
