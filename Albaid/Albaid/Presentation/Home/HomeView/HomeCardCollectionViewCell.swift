//
//  HomeCardCollectionViewCell.swift
//  Albaid
//
//  Created by 박지윤 on 9/28/24.
//

import UIKit

final class HomeCardCollectionViewCell: UICollectionViewCell {

    static let identifier = "HomeCardCollectionViewCell"

    // MARK: UI Components
    private(set) var indexLabel = UILabel().then {
        $0.textColor = .gray100
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 16)
    }

    private(set) var detailButton = BaseButton().then {
        $0.setImage(AlbaidButton.detail, for: .normal)
    }

    private(set) var workplaceLabel = UILabel().then {
        $0.textColor = .gray100
        $0.font = UIFont(name: "Pretendard-Regular", size: 13)
    }

    private(set) var wageTextLabel = UILabel().then {
        $0.textColor = .gray100
        $0.font = UIFont(name: "Pretendard-Medium", size: 13)
    }

    private(set) var wageLabel = UILabel().then {
        $0.textColor = .gray100
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 36)
    }

    private(set) var coffeeImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
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
        contentView.addSubview(indexLabel)
        contentView.addSubview(workplaceLabel)
        contentView.addSubview(wageTextLabel)
        contentView.addSubview(wageLabel)
        contentView.addSubview(coffeeImageView)
    }

    // MARK: Layout
    private func makeConstraints() {
        indexLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }

        workplaceLabel.snp.makeConstraints {
            $0.top.equalTo(indexLabel.snp.bottom).offset(3)
            $0.leading.equalToSuperview()
        }

        wageTextLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalTo(wageLabel.snp.top).inset(3)
        }

        wageLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
        }

        coffeeImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(21)
            $0.centerY.equalToSuperview()
        }
    }
}

