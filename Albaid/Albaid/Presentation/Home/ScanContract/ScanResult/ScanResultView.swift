//
//  ScanResultView.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class ScanResultView: BaseView {

    // MARK: UI Components
    private(set) var scanResultLabel = UILabel().then {
        $0.text = AlbaidString.scanResult
        $0.textColor = .gray20
        $0.numberOfLines = 2
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 28)
    }

    private(set) var scanResultTipView = UIView().then {
        $0.layer.cornerRadius = 12
        $0.backgroundColor = .lightGreen
    }

    private(set) var safetyImageView = UIImageView().then {
        $0.image = AlbaidImage.safety
        $0.contentMode = .scaleAspectFit
    }

    private(set) var safetyLabel = UILabel().then {
        $0.text = AlbaidString.safety
        $0.textColor = .safetyGreen
        $0.numberOfLines = 2
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 15)
    }

    private(set) var scanResultTopContentView = UIView().then {
        $0.layer.cornerRadius = 12
        $0.backgroundColor = .gray95
    }
    
    private(set) var dividerView = UIView().then {
        $0.backgroundColor = .gray70
    }

    private(set) var scanResultBottomContentView = UIView().then {
        $0.layer.cornerRadius = 12
        $0.backgroundColor = .gray95
    }

    private(set) var reScanButton = BaseButton().then {
        $0.setTextButton(title: "다시 촬영하기", titleColor: .gray20 ?? .black, backgroundColor: .gray95 ?? .white)
    }

    private(set) var registerButton = BaseButton().then {
        $0.setTextButton(title: "등록하기", titleColor: .white, backgroundColor: .gray20 ?? .black)
    }

    // MARK: Properties

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(scanResultLabel)
        addSubview(scanResultTipView)

        scanResultTipView.addSubview(safetyImageView)
        scanResultTipView.addSubview(safetyLabel)

        addSubview(scanResultTopContentView)
        addSubview(dividerView)
        addSubview(scanResultBottomContentView)
        addSubview(reScanButton)
        addSubview(registerButton)
    }

    // MARK: Layout
    override func makeConstraints() {
        scanResultLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(123)
            $0.leading.equalToSuperview()
        }

        scanResultTipView.snp.makeConstraints {
            $0.top.equalTo(scanResultLabel.snp.bottom).offset(25)
            $0.width.equalToSuperview()
            $0.height.equalTo(76)
        }

        safetyImageView.snp.makeConstraints {
            $0.top.equalTo(safetyLabel.snp.top)
            $0.leading.equalToSuperview().inset(20)
            $0.height.width.equalTo(24)
        }

        safetyLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(safetyImageView.snp.trailing).offset(10)
        }

        scanResultTopContentView.snp.makeConstraints {
            $0.top.equalTo(scanResultTipView.snp.bottom).offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(259)
        }

        dividerView.snp.makeConstraints {
            $0.top.equalTo(scanResultTopContentView.snp.bottom)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(1)
        }

        scanResultBottomContentView.snp.makeConstraints {
            $0.top.equalTo(dividerView.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalTo(142)
        }

        let screenWidth = UIScreen.main.bounds.width - 40
        let buttonWidth = screenWidth/2 - 6.5

        reScanButton.snp.makeConstraints {
            $0.top.equalTo(scanResultBottomContentView.snp.bottom).offset(56)
            $0.leading.equalToSuperview()
            $0.width.equalTo(buttonWidth)
        }

        registerButton.snp.makeConstraints {
            $0.top.equalTo(scanResultBottomContentView.snp.bottom).offset(56)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(buttonWidth)
        }
    }
}
