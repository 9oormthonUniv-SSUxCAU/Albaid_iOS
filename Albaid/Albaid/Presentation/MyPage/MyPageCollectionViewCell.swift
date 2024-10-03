//
//  MyPageCollectionViewCell.swift
//  Albaid
//
//  Created by 박지윤 on 10/2/24.
//

import UIKit

final class MyPageCollectionViewCell: UICollectionViewCell {

    static let identifier = "MyPageCollectionViewCell"

    // MARK: UI Components
    private(set) var titleLabel = UILabel().then {
        $0.text = "계정 설정"
        $0.textColor = .albaidGray30
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 16)
    }

    private(set) var detailButton = BaseButton().then {
        $0.setImage(AlbaidButton.detail.withTintColor(.albaidGray60), for: .normal)
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
        addSubview(titleLabel)
        addSubview(detailButton)
    }

    // MARK: Layout
    private func makeConstraints() {
        titleLabel.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.leading.equalToSuperview()
        }

        detailButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview()
        }
    }

    func setData(data: Card?) {
    }
}

