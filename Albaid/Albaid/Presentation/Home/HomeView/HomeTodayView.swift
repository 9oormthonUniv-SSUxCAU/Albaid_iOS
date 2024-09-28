//
//  HomeTodayView.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class HomeTodayView: BaseView {

    // MARK: UI Components
    private(set) var userLabel = UILabel().then {
        $0.textColor = .gray50
        $0.font = UIFont(name: "Pretendard-Medium", size: 16)
    }

    private(set) var dateLabel = UILabel().then {
        $0.textColor = .gray20
        $0.font = UIFont(name: "Pretendard-Semibold", size: 18)
    }

    private let characterImageView = UIImageView().then {
        $0.image = AlbaidImage.character0
        $0.contentMode = .scaleAspectFit
    }

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(userLabel)
        addSubview(dateLabel)
        addSubview(characterImageView)
    }

    // MARK: Layout
    override func makeConstraints() {
        userLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(35)
            $0.leading.equalToSuperview()
        }

        dateLabel.snp.makeConstraints {
            $0.top.equalTo(userLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview()
        }

        characterImageView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(80)
        }
    }
}
