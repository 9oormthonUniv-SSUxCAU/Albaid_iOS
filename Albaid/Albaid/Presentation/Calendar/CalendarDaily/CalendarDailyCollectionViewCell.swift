//
//  CalendarDailyCollectionViewCell.swift
//  Albaid
//
//  Created by 박지윤 on 10/4/24.
//

import UIKit

final class CalendarDailyCollectionViewCell: UICollectionViewCell {

    static let identifier = "CalendarDailyCollectionViewCell"

    // MARK: UI Components
    private(set) var imageBackgroundView = UIView().then {
        $0.backgroundColor = .albaidGray100
        $0.layer.cornerRadius = 22
    }

    private(set) var cupImageView = UIImageView().then {
        $0.image = AlbaidImage.cup.withTintColor(.albaidSubBlue)
    }

    private(set) var labelStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 5
    }

    private(set) var titleLabel = UILabel().then {
        $0.text = "알바 카드1"
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 22)
    }

    private(set) var contentLabel = UILabel().then {
        $0.text = "9월 22일 | 10:00 - 14:00"
        $0.textColor = .albaidGray40
        $0.font = UIFont(name: "Pretendard-Medium", size: 16)
    }

    private(set) var detailButton = BaseButton().then {
        $0.setImage(AlbaidButton.menu.withTintColor(.albaidGray50), for: .normal)
    }

    private(set) var dividerView = DividerView(dividerType: .thin)

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
        contentView.addSubview(imageBackgroundView)
        imageBackgroundView.addSubview(cupImageView)
        contentView.addSubview(labelStackView)
        labelStackView.addArrangedSubviews(titleLabel, contentLabel)
        contentView.addSubview(detailButton)
        contentView.addSubview(dividerView)
    }

    // MARK: Layout
    private func makeConstraints() {
        imageBackgroundView.snp.makeConstraints {
            $0.leading.centerY.equalToSuperview()
            $0.height.width.equalTo(44)
        }

        cupImageView.snp.makeConstraints {
            $0.center.equalTo(imageBackgroundView)
            $0.height.width.equalTo(24)
        }

        labelStackView.snp.makeConstraints {
            $0.leading.equalTo(imageBackgroundView.snp.trailing).offset(20)
            $0.centerY.equalToSuperview()
        }

        detailButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(25)
            $0.trailing.equalToSuperview()
            $0.height.width.equalTo(24)
        }

        dividerView.snp.makeConstraints {
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }

    func setData(data: Card?) {
    }
}

