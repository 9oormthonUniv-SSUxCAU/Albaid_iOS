//
//  HomeMenuView.swift
//  Albaid
//
//  Created by 박지윤 on 9/28/24.
//

import UIKit

final class HomeMenuView: BaseView {

    // MARK: UI Components
    private(set) var scanButton = BaseButton().then {
        $0.setMenuButton(image: AlbaidButton.camera, title: "계약서 스캔")
    }

    private(set) var contractButton = BaseButton().then {
        $0.setMenuButton(image: AlbaidButton.contract, title: "근로계약서")
    }

    private(set) var resumeButton = BaseButton().then {
        $0.setMenuButton(image: AlbaidButton.resume, title: "이력서")
    }

    private(set) var dividerView = UIView().then {
        $0.backgroundColor = .albaidGray70
    }

    private(set) var dividerView2 = UIView().then {
        $0.backgroundColor = .albaidGray70
    }

    // MARK: Properties
    var tapScan: (() -> Void)?
    var tapContract: (() -> Void)?
    var tapResume: (() -> Void)?

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(scanButton)
        addSubview(contractButton)
        addSubview(resumeButton)
        addSubview(dividerView)
        addSubview(dividerView2)

        backgroundColor = .albaidGray100
        layer.cornerRadius = 12

        addButtonEvent()
    }
    
    // MARK: Layout
    override func makeConstraints() {
        let dividerOffset1 = (UIScreen.main.bounds.width - 40) * 1/3
        let dividerOffset2 = (UIScreen.main.bounds.width - 40) * 2/3
        let buttonOffset = (UIScreen.main.bounds.width - 40) * 1/6

        scanButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(buttonOffset - 35)
        }

        dividerView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(dividerOffset1)
            $0.height.equalToSuperview().inset(25)
            $0.width.equalTo(1)
        }

        contractButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }

        dividerView2.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(dividerOffset2)
            $0.height.equalToSuperview().inset(25)
            $0.width.equalTo(1)
        }

        resumeButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(buttonOffset - 35)
        }
    }

    // MARK: Event
    private func addButtonEvent() {
        scanButton.addTarget(self, action: #selector(handleScanButton), for: .touchUpInside)
        contractButton.addTarget(self, action: #selector(handleContractButton), for: .touchUpInside)
        resumeButton.addTarget(self, action: #selector(tapResumeButton), for: .touchUpInside)
    }

    @objc
    private func handleScanButton() {
        tapScan?()
    }

    @objc
    private func handleContractButton() {
        tapContract?()
    }

    @objc
    private func tapResumeButton() {
        tapResume?()
    }
}
