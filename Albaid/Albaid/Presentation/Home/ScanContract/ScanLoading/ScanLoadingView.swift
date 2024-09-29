//
//  ScanLoadingView.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class ScanLoadingView: BaseView {
    
    // MARK: UI Components
    private(set) var scanLoadingLabel = UILabel().then {
        $0.text = AlbaidString.scanLoading
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 28)
    }

    private(set) var scanLoadingImageView = UIImageView().then {
        $0.image = AlbaidImage.scanLoading
        $0.contentMode = .scaleAspectFit
    }

    // MARK: Properties

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(scanLoadingLabel)
        addSubview(scanLoadingImageView)
    }

    // MARK: Layout
    override func makeConstraints() {
        scanLoadingLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(160)
            $0.centerX.equalToSuperview()
        }

        scanLoadingImageView.snp.makeConstraints {
            $0.top.equalTo(scanLoadingLabel.snp.bottom).offset(90)
            $0.centerX.equalToSuperview()
        }
    }
}
