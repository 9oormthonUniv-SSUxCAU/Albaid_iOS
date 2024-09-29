//
//  HomeAdView.swift
//  Albaid
//
//  Created by 박지윤 on 9/28/24.
//

import UIKit

final class HomeAdView: BaseView {

    // MARK: UI Components
    private(set) var adLabel = UILabel().then {
        $0.text = "알바몬 제트로\n1시간에 2건씩 맞춤 알바를 추천받아요!"
        $0.textColor = .albaidNavy
        $0.font = UIFont(name: "Pretendard-Bold", size: 15)
        $0.numberOfLines = 2
    }

    private let adImageView = UIImageView().then {
        $0.image = AlbaidImage.ad
        $0.contentMode = .scaleAspectFit
    }

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(adLabel)
        addSubview(adImageView)

        backgroundColor = .albaidSkyblue
    }

    // MARK: Layout
    override func makeConstraints() {
        adLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }

        adImageView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().inset(31)
            $0.height.equalTo(56)
        }
    }
}
