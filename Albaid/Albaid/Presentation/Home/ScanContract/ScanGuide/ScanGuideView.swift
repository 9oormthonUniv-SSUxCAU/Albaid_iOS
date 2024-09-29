//
//  ScanGuideView.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class ScanGuideView: BaseView {
    
    // MARK: UI Components
    private(set) var contractGuideLabel = UILabel().then {
        $0.text = AlbaidString.contractGuide
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 28)
    }

    private(set) var guideImageView = UIImageView().then {
        $0.image = AlbaidImage.contractGuide
        $0.contentMode = .scaleAspectFit
    }

    private(set) var cameraGuideLabel = UILabel().then {
        $0.text = AlbaidString.cameraGuide
        $0.textColor = .albaidGray30
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 20)
    }

    private(set) var cameraGuideDetailLabel = UILabel().then {
        $0.text = AlbaidString.cameraGuideDetail
        $0.textColor = .albaidGray50
        $0.numberOfLines = 0
        $0.font = UIFont(name: "Pretendard-Regular", size: 15)
        $0.setLineSpacing(lineSpacing: 8)
    }

    private(set) var cameraButton = BaseButton().then {
        $0.setTextButton(title: "근로계약서 촬영하기", titleColor: .white, backgroundColor: .albaidGray20)
    }

    // MARK: Properties
    var tapCamera: (() -> Void)?

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(contractGuideLabel)
        addSubview(guideImageView)
        addSubview(cameraGuideLabel)
        addSubview(cameraGuideDetailLabel)
        addSubview(cameraButton)

        addButtonEvent()
    }

    // MARK: Layout
    override func makeConstraints() {
        contractGuideLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(123)
            $0.leading.equalToSuperview()
        }

        guideImageView.snp.makeConstraints {
            $0.top.equalTo(contractGuideLabel.snp.bottom).offset(83)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(180)
        }

        cameraGuideLabel.snp.makeConstraints {
            $0.top.equalTo(guideImageView.snp.bottom).offset(109)
            $0.leading.equalToSuperview()
        }

        cameraGuideDetailLabel.snp.makeConstraints {
            $0.top.equalTo(cameraGuideLabel.snp.bottom).offset(14)
            $0.leading.equalToSuperview()
        }

        cameraButton.snp.makeConstraints {
            $0.top.equalTo(cameraGuideDetailLabel.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
        }
    }

    // MARK: Event
    private func addButtonEvent() {
        cameraButton.addTarget(self, action: #selector(handleCameraButton), for: .touchUpInside)
    }

    @objc
    private func handleCameraButton() {
        tapCamera?()
    }
}
