//
//  SplashView.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class SplashView: BaseView {

    // MARK: UI Components
    private let splashImageView = UIImageView().then {
        $0.image = AlbaidImage.splash
    }

    // MARK: Configuration
    override func configureSubviews() {
        backgroundColor = .mainGreen

        addSubview(splashImageView)
    }

    // MARK: Layout
    override func makeConstraints() {
        splashImageView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(276)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(191)
        }
    }
}
